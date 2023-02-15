import 'package:hive_flutter/hive_flutter.dart';

import '../podo/pokemon_detail.dart';
import 'repository_box_name.dart';

class PokemonDetailRepository {
  static Future<PokemonDetail?> getPokemonDetail(String name) async {
    LazyBox box = await Hive.openLazyBox<PokemonDetail>(RepositoryBoxName.pokemonDetail);
    return await box.get(name);
  }

  static Future<void> setPokemonDetail(PokemonDetail pokemonDetail) async {
    LazyBox box = await Hive.openLazyBox<PokemonDetail>(RepositoryBoxName.pokemonDetail);
    await box.put(pokemonDetail.name, pokemonDetail);
  }
}
