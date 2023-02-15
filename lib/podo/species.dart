import 'package:hive/hive.dart';

import 'type_ids.dart';

part 'species.g.dart';

@HiveType(typeId: TypeId.species)
class Species {
  @HiveField(0)
  int? baseHappiness;
  int? captureRate;

  /// Pokemon Name;
  List<String>? varieties;
}
