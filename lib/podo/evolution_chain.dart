import 'package:hive_flutter/hive_flutter.dart';

import 'evolution_detail.dart';
import 'type_ids.dart';

part 'evolution_chain.g.dart';

@HiveType(typeId: TypeId.evolutionChain, adapterName: "EvolutionChainAdapter")
class EvolutionChain {
  @HiveField(0)
  int? id;

  @HiveField(1)
  List<EvolutionDetail?>? evolutionDetail;

  @HiveField(2)
  List<EvolutionChain?>? evolveTo;

  @HiveField(3)
  String? speciesName;

  @HiveField(4)
  String? speciesUrl;

  @override
  String toString() {
    return <String, dynamic>{
      "id": id,
      "evolutionDetail": evolutionDetail.toString(),
      "evolveTo": evolveTo.toString(),
      "speciesName": speciesName,
      "speciesUrl": speciesUrl,
    }.toString();
  }

  EvolutionChain({
    this.evolutionDetail,
    this.evolveTo,
    this.id,
    this.speciesName,
    this.speciesUrl,
  });

  static EvolutionChain? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return EvolutionChain(id: json["id"], speciesName: json["species"]?["name"], speciesUrl: json["species"]?["url"], evolveTo: [
      for (final evolveTo in json["evolves_to"] as List<dynamic>) EvolutionChain.fromJson(evolveTo),
    ], evolutionDetail: [
      for (final evolutionDetail in json["evolution_details"]) EvolutionDetail.fromJson(evolutionDetail),
    ]);
  }
}
