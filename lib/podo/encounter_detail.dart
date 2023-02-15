import 'package:hive/hive.dart';

import 'type_ids.dart';

part 'encounter_detail.g.dart';

@HiveType(typeId: TypeId.encounterDetail)
class EncounterDetail {
  @HiveField(0)
  int? chance;

  @HiveField(1)
  int? maxLevel;

  @HiveField(2)
  int? minLevel;

  @HiveField(3)
  String? method;

  @HiveField(4)
  List<String>? conditions;

  @override
  String toString() {
    return <String, dynamic>{
      "chance": chance,
      "maxLevel": maxLevel,
      "minLevel": minLevel,
      "method": method,
      "conditions": conditions,
    }.toString();
  }

  EncounterDetail({
    this.chance,
    this.conditions,
    this.maxLevel,
    this.method,
    this.minLevel,
  });

  static EncounterDetail? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return EncounterDetail(
      chance: json["chance"],
      maxLevel: json["max_level"],
      minLevel: json["min_level"],
      method: json["method"]?["name"],
      conditions: (json["condition_values"] as List<dynamic>?)?.map((e) => (e["name"] as String?) ?? "").toList(),
    );
  }
}
