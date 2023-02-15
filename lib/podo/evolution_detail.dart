import 'package:hive_flutter/hive_flutter.dart';

import 'type_ids.dart';

part 'evolution_detail.g.dart';

@HiveType(typeId: TypeId.evolutionDetail, adapterName: "EvolutionDetailAdapter")
class EvolutionDetail {
  @HiveField(0)
  int? gender;

  /// HeldItem name
  @HiveField(1)
  String? heldItem;

  /// Item name
  @HiveField(2)
  String? item;

  /// KnownMove name
  @HiveField(3)
  String? knownMove;

  /// KnownMoveType name
  @HiveField(4)
  String? knownMoveType;

  /// Location name
  @HiveField(5)
  String? location;

  @HiveField(6)
  int? minAffection;
  @HiveField(7)
  int? minBeauty;
  @HiveField(8)
  int? minHappiness;
  @HiveField(9)
  int? minLevel;
  @HiveField(10)
  bool? needsOverworldRain;

  /// PartySpecies name
  @HiveField(11)
  String? partySpecies;

  /// PartyType name
  @HiveField(12)
  String? partyType;

  @HiveField(13)
  int? relativePhysicalStats;
  @HiveField(14)
  String? timeOfDay;

  /// TradeSpecies name
  @HiveField(15)
  String? tradeSpecies;

  /// Trigger name
  @HiveField(16)
  String? trigger;

  @HiveField(17)
  bool? turnUpsideDown;

  EvolutionDetail({
    this.gender,
    this.heldItem,
    this.item,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minAffection,
    this.minBeauty,
    this.minHappiness,
    this.minLevel,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.trigger,
    this.turnUpsideDown,
  });

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) {
    return EvolutionDetail(
      gender: json["gender"],
      heldItem: json["heldItem"]?["name"],
      item: json["item"]?["name"],
      knownMove: json["knownMove"]?["name"],
      knownMoveType: json["knownMoveType"]?["name"],
      location: json["location"]?["name"],
      minAffection: json["minAffection"],
      minBeauty: json["minBeauty"],
      minHappiness: json["minHappiness"],
      minLevel: json["minLevel"],
      needsOverworldRain: json["needsOverworldRain"],
      partySpecies: json["partySpecies"]?["name"],
      partyType: json["partyType"]?["name"],
      relativePhysicalStats: json["relativePhysicalStats"],
      timeOfDay: json["timeOfDay"],
      tradeSpecies: json["tradeSpecies"]?["name"],
      trigger: json["trigger"]?["name"],
      turnUpsideDown: json["turnUpsideDown"],
    );
  }

  @override
  String toString() {
    return <String, dynamic>{
      "gender": gender,
      "heldItem": heldItem,
      "item": item,
      "knownMove": knownMove,
      "knownMoveType": knownMoveType,
      "location": location,
      "minAffection": minAffection,
      "minBeauty": minBeauty,
      "minHappiness": minHappiness,
      "minLevel": minLevel,
      "needsOverworldRain": needsOverworldRain,
      "partySpecies": partySpecies,
      "partyType": partyType,
      "relativePhysicalStats": relativePhysicalStats,
      "timeOfDay": timeOfDay,
      "tradeSpecies": tradeSpecies,
      "trigger": trigger,
      "turnUpsideDown": turnUpsideDown,
    }.toString();
  }
}
