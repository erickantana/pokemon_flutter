import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../podo/pokemon.dart';

class PokemonRepository {
  static Future<Map<int, Pokemon>> getPokemons({required int limit, required int offset}) async {
    log("Pokemon@Fetch Pokemon@local: (limit: $limit, offset: $offset)");
    LazyBox<Pokemon> lazyBox = await Hive.openLazyBox("pokemons");
    return {
      for (int i = offset; i < offset + limit && await lazyBox.get(i, defaultValue: null) != null; i++) i: (await lazyBox.get(i))!,
    };
  }

  static Future<void> updatePokemons(Map<int, Pokemon> pokemons) async {
    log("Pokemon@Update Pokemon@local");
    LazyBox<Pokemon> lazyBox = await Hive.openLazyBox("pokemons");
    for (var entry in pokemons.entries) {
      await lazyBox.put(entry.key, entry.value);
    }
  }

  static Future<int?> getPokemonCount() async {
    log("Pokemon@Get Pokemon Count@local");
    Box box = await Hive.openBox("metadata");
    return await box.get("pokemonCount");
  }

  static Future<void> updatePokemonCount(int count) async {
    log("Pokemon@Update Pokemon Count@local");
    Box box = await Hive.openBox("metadata");
    await box.put("pokemonCount", count);
  }
}
