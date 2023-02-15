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
  String? evolutionChainUrl;

  @HiveField(4)
  List<Encounter?>? encounters;

  @HiveField(5)
  int? height;

  @HiveField(6)
  int? weight;

  @HiveField(7)
  String? speciesUrl;

  @HiveField(8)
  List<Stat?>? stats;

  @HiveField(9)
  List<Move?>? moves;

  @HiveField(10)
  List<Ability?>? abilities;

  @HiveField(11)
  List<PokemonType?>? pokemonTypes;

  @override
  String toString() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "sprites": sprites.toString(),
      "evolutionChainUrl": evolutionChainUrl,
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
    this.evolutionChainUrl,
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
    String? evolutionChainUrl,
    List<Encounter?>? encounters,
    String? speciesUrl,
  }) {
    if (queryResult == null) return null;
    return PokemonDetail(
      id: queryResult.id,
      name: queryResult.name,
      sprites: Sprite.fromQueryResult(queryResult.sprites),
      evolutionChainUrl: evolutionChainUrl,
      encounters: encounters,
      height: queryResult.height,
      weight: queryResult.weight,
      speciesUrl: speciesUrl,
      stats: queryResult.stats?.map((e) => Stat.fromQueryResult(e)).toList(),
      moves: queryResult.moves?.map((e) => Move.fromQueryResult(e)).toList(),
      abilities: queryResult.abilities?.map((e) => Ability.fromQueryResult(e)).toList(),
      pokemonTypes: queryResult.types?.map((e) => PokemonType.fromQueryResult(e)).toList(),
    );
  }
}
