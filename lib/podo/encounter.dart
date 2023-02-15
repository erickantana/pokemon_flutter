import 'package:hive/hive.dart';

import 'encounter_version.dart';
import 'location.dart';
import 'type_ids.dart';

part 'encounter.g.dart';

@HiveType(typeId: TypeId.encounter)
class Encounter {
  @HiveField(0)
  Location? location;

  @HiveField(1)
  List<EncounterVersion?>? encounterVersions;

  @override
  String toString() {
    return <String, dynamic>{
      "location": location.toString(),
      "encounterVersions": encounterVersions.toString(),
    }.toString();
  }

  Encounter(this.location, this.encounterVersions);

  static Encounter? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return Encounter(
      Location.fromJson(json["location_area"]),
      (json["version_details"] as List<dynamic>?)?.map((e) => EncounterVersion.fromJson(e)).toList(),
    );
  }
}
