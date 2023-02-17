import 'package:hive/hive.dart';

import 'type_ids.dart';

part 'species.g.dart';

@HiveType(typeId: TypeId.species)
class Species {
  @HiveField(0)
  int? baseHappiness;

  @HiveField(1)
  int? captureRate;

  @HiveField(2)
  String? evolutionChainUrl;

  /// Pokemon Name;
  @HiveField(3)
  List<String>? varieties;

  Species({
    this.baseHappiness,
    this.captureRate,
    this.varieties,
    this.evolutionChainUrl,
  });

  static Species? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Species(
      baseHappiness: json["base_happiness"],
      captureRate: json["capture_rate"],
      varieties: (json["varieties"] as List<dynamic>?)?.map((variety) => (variety?["pokemon"]["name"] as String?) ?? "").toList(),
      evolutionChainUrl: json["evolution_chain"]?["url"],
    );
  }
}
