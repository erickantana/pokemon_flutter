import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/data_source.dart';
import '../../podo/pokemon.dart';
import '../../repositories/pokemon_repository.dart';
import '../../schemas/schema.graphql.dart';

class PokemonsState {
  Map<int, Pokemon> pokemons = {};
  int? count;

  PokemonsState({required this.pokemons, this.count});
}

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(PokemonsState(pokemons: {}));

  Future<void> fetchPokemon({required int limit, required int offset, bool skipNetwork = false}) async {
    final pokemonCount = await PokemonRepository.getPokemonCount();
    log("Pokemon@state.length: ${state.pokemons.length}");
    if (pokemonCount != null && state.pokemons.length >= pokemonCount) return;

    final pokemons = await PokemonRepository.getPokemons(limit: limit, offset: offset);
    if (!skipNetwork) {
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
          await fetchPokemon(limit: limit, offset: offset, skipNetwork: true);
        }
      });
    }
    if (pokemons.isNotEmpty) emit(PokemonsState(pokemons: {...state.pokemons, ...pokemons}, count: pokemonCount));
  }
}
