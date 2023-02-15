import 'package:hive/hive.dart';

import 'encounter_detail.dart';
import 'type_ids.dart';

part 'encounter_version.g.dart';

@HiveType(typeId: TypeId.encounterVersion)
class EncounterVersion {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? maxChance;

  @HiveField(2)
  List<EncounterDetail?>? encounterDetails;

  @override
  String toString() {
    return <String, dynamic>{
      "name": name,
      "maxChance": maxChance,
      "encounterDetails": encounterDetails.toString(),
    }.toString();
  }

  EncounterVersion(this.name, this.maxChance, this.encounterDetails);

  static EncounterVersion? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return EncounterVersion(
      json["version"]?["name"],
      json["max_chance"],
      (json["encounter_details"] as List<dynamic>?)?.map((e) => EncounterDetail.fromJson(e)).toList(),
    );
  }
}
