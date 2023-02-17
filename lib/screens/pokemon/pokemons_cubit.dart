import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/data_source.dart';
import '../../podo/pokemon.dart';
import '../../repositories/pokemon_repository.dart';
import '../../schemas/schema.graphql.dart';

class PokemonsState {
  Map<int, Pokemon> firstList;
  Map<int, Pokemon> secondList;
  Map<int, Pokemon> thirdList;
  int? count;

  PokemonsState({required this.firstList, required this.secondList, required this.thirdList, this.count});
}

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(PokemonsState(firstList: {}, secondList: {}, thirdList: {}));

  bool _isFetching = false;

  int get _pokemonLength => state.firstList.length + state.secondList.length + state.thirdList.length;

  Future<void> fetchPokemon(int limit) async {
    if (_isFetching) return;
    _isFetching = true;

    int offset = _pokemonLength;
    await _fetchLocal(limit: limit, offset: offset);
    _fetchRemote(limit: limit, offset: offset);

    _isFetching = false;
  }

  Future<void> _fetchLocal({required int limit, required int offset}) async {
    final pokemonCount = await PokemonRepository.getPokemonCount();
    if (pokemonCount != null && _pokemonLength >= pokemonCount) return;

    final pokemons = await PokemonRepository.getPokemons(limit: limit, offset: offset);

    List<Map<int, Pokemon>> maps = [state.firstList, state.secondList, state.thirdList];
    final mapLeastCount = maps.reduce((value, element) => value.length <= element.length ? value : element);
    int cursor = maps.indexOf(mapLeastCount);
    if (pokemons.isNotEmpty) {
      pokemonEntries:
      for (var pokemonEntry in pokemons.entries) {
        for (final map in maps) {
          if (map.containsKey(pokemonEntry.key)) {
            map[pokemonEntry.key] = pokemonEntry.value;
            continue pokemonEntries;
          }
        }
        maps[cursor].putIfAbsent(pokemonEntry.key, () => pokemonEntry.value);
        cursor = (cursor + 1) % maps.length;
      }
      emit(PokemonsState(firstList: state.firstList, secondList: state.secondList, thirdList: state.thirdList, count: pokemonCount));
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
