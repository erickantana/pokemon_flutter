import 'package:hive_flutter/hive_flutter.dart';

import 'evolution_chain.dart';
import 'type_ids.dart';

part 'pokemon.g.dart';

@HiveType(typeId: TypeId.pokemon, adapterName: "PokemonAdapter")
class Pokemon extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? url;

  @HiveField(3)
  String? image;

  @HiveField(4)
  EvolutionChain? evolutionChain;
}
