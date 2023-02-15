import 'package:hive_flutter/hive_flutter.dart';

import '../schemas/schema.graphql.dart';
import 'type_ids.dart';

part 'stat.g.dart';

@HiveType(typeId: TypeId.stat, adapterName: "StatAdapter")
class Stat {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? baseStat;

  @HiveField(2)
  int? effort;

  @override
  String toString() {
    return <String, dynamic>{
      "name": name,
      "baseStat": baseStat,
      "effort": effort,
    }.toString();
  }

  Stat({this.name, this.baseStat, this.effort});

  static Stat? fromQueryResult(Query$pokemon$pokemon$stats? queryResult) {
    if (queryResult == null) return null;

    return Stat(
      name: queryResult.stat?.name,
      baseStat: queryResult.base_stat,
      effort: queryResult.effort,
    );
  }
}
