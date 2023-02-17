import 'package:hive_flutter/hive_flutter.dart';

import '../podo/pokemon.dart';
import 'repository_box_name.dart';

class PokemonRepository {
  static Future<Map<int, Pokemon>> getPokemons({required int limit, required int offset}) async {
    LazyBox<Pokemon> lazyBox = await Hive.openLazyBox(RepositoryBoxName.pokemons);
    return {
      for (int i = offset; i < offset + limit && await lazyBox.get(i, defaultValue: null) != null; i++) i: (await lazyBox.get(i))!,
    };
  }

  static Future<void> updatePokemons(Map<int, Pokemon> pokemons) async {
    LazyBox<Pokemon> lazyBox = await Hive.openLazyBox(RepositoryBoxName.pokemons);
    for (var entry in pokemons.entries) {
      await lazyBox.put(entry.key, entry.value);
    }
  }

  static Future<int?> getPokemonCount() async {
    Box box = await Hive.openBox(MetadataBoxName.name);
    return await box.get(MetadataBoxName.pokemonCount);
  }

  static Future<void> updatePokemonCount(int count) async {
    Box box = await Hive.openBox(MetadataBoxName.name);
    await box.put(MetadataBoxName.pokemonCount, count);
  }
}
