import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/data_source.dart';
import '../../podo/pokemon.dart';
import '../../repositories/pokemon_repository.dart';
import '../../schemas/schema.graphql.dart';

class PokemonsState {
  Map<int, Pokemon> pokemons;
  int? count;

  PokemonsState({required this.pokemons, this.count});
}

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(PokemonsState(pokemons: {}));

  bool _isFetching = false;

  Future<void> fetchPokemon(int limit) async {
    if (_isFetching) return;
    _isFetching = true;

    int offset = state.pokemons.length;
    await _fetchLocal(limit: limit, offset: offset);
    _fetchRemote(limit: limit, offset: offset);

    _isFetching = false;
  }

  Future<void> _fetchLocal({required int limit, required int offset}) async {
    final pokemonCount = await PokemonRepository.getPokemonCount();
    if (pokemonCount != null && state.pokemons.length >= pokemonCount) return;

    final pokemons = await PokemonRepository.getPokemons(limit: limit, offset: offset);

    if (pokemons.isNotEmpty && !isClosed) {
      emit(PokemonsState(pokemons: {...state.pokemons, ...pokemons}, count: pokemonCount));
    }
  }

  Future<void> _fetchRemote({required int limit, required int offset}) async {
    DataSource.fetchPokemons(limit: limit, offset: offset).then((Query$pokemons$pokemons? paginatedPokemon) async {
      if (paginatedPokemon == null) return;
      final results = paginatedPokemon.results ?? [];
      final pokemons = {
        for (var i = 0; i < results.length; i++)
          i + offset: Pokemon()
            ..id = results[i]?.id
            ..image = results[i]?.image
            ..name = results[i]?.name
            ..url = results[i]?.url,
      };
      await PokemonRepository.updatePokemonCount(paginatedPokemon.count);
      if (pokemons.isNotEmpty) {
        await PokemonRepository.updatePokemons(pokemons);
        await _fetchLocal(limit: limit, offset: offset);
      }
    });
  }
}
