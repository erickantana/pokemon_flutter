import 'package:hive_flutter/hive_flutter.dart';

import 'evolution_detail.dart';
import 'type_ids.dart';

part 'evolution_chain.g.dart';

@HiveType(typeId: TypeId.evolutionChain, adapterName: "EvolutionChainAdapter")
class EvolutionChain {
  @HiveField(0)
  int? id;

  @HiveField(1)
  List<EvolutionDetail>? evolutionDetail;

  @HiveField(2)
  List<EvolutionChain>? evolveTo;

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
}
