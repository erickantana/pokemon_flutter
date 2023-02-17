import 'package:hive_flutter/hive_flutter.dart';

import '../schemas/schema.graphql.dart';
import 'ability.dart';
import 'encounter.dart';
import 'move.dart';
import 'pokemon_type.dart';
import 'sprite.dart';
import 'stat.dart';
import 'type_ids.dart';

part 'pokemon_detail.g.dart';

@HiveType(typeId: TypeId.pokemonDetail, adapterName: "PokemonDetailAdapter")
class PokemonDetail extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  Sprite? sprites;

  @HiveField(3)
  List<Encounter?>? encounters;

  @HiveField(4)
  int? height;

  @HiveField(5)
  int? weight;

  @HiveField(6)
  String? speciesUrl;

  @HiveField(7)
  List<Stat?>? stats;

  @HiveField(8)
  List<Move?>? moves;

  @HiveField(9)
  List<Ability?>? abilities;

  @HiveField(10)
  List<PokemonType?>? pokemonTypes;

  @override
  String toString() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "sprites": sprites.toString(),
      "encounters": encounters.toString(),
      "height": height,
      "weight": weight,
      "stats": stats.toString(),
      "moves": moves.toString(),
      "abilities": abilities.toString(),
      "pokemonTypes": pokemonTypes.toString(),
    }.toString();
  }

  PokemonDetail({
    this.id,
    this.name,
    this.sprites,
    this.encounters,
    this.height,
    this.weight,
    this.speciesUrl,
    this.stats,
    this.moves,
    this.abilities,
    this.pokemonTypes,
  });

  static PokemonDetail? fromQueryResult({
    Query$pokemon$pokemon? queryResult,
    List<Encounter?>? encounters,
  }) {
    if (queryResult == null) return null;
    return PokemonDetail(
      id: queryResult.id,
      name: queryResult.name,
      sprites: Sprite.fromQueryResult(queryResult.sprites),
      encounters: encounters,
      height: queryResult.height,
      weight: queryResult.weight,
      speciesUrl: queryResult.species?.url,
      stats: queryResult.stats?.map((e) => Stat.fromQueryResult(e)).toList(),
      moves: queryResult.moves?.map((e) => Move.fromQueryResult(e)).toList(),
      abilities: queryResult.abilities?.map((e) => Ability.fromQueryResult(e)).toList(),
      pokemonTypes: queryResult.types?.map((e) => PokemonType.fromQueryResult(e)).toList(),
    );
  }
}
