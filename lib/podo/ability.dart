import 'package:hive_flutter/hive_flutter.dart';

import '../schemas/schema.graphql.dart';
import 'type_ids.dart';

part 'ability.g.dart';

@HiveType(typeId: TypeId.ability)
class Ability {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? slot;

  @HiveField(2)
  bool? isHidden;

  @override
  String toString() {
    return <String, dynamic>{
      "name": name,
      "slot": slot,
      "isHidden": isHidden,
    }.toString();
  }

  Ability(this.name, this.slot, this.isHidden);

  static Ability? fromQueryResult(Query$pokemon$pokemon$abilities? queryResult) {
    if (queryResult == null) return null;

    return Ability(queryResult.ability?.name, queryResult.slot, queryResult.is_hidden);
  }
}
