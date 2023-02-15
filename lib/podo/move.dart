import 'package:hive_flutter/hive_flutter.dart';

import '../schemas/schema.graphql.dart';
import 'type_ids.dart';

part 'move.g.dart';

@HiveType(typeId: TypeId.move)
class Move {
  @HiveField(0)
  String? name;

  @override
  String toString() {
    return {"name": name}.toString();
  }

  Move(this.name);

  static Move? fromQueryResult(Query$pokemon$pokemon$moves? queryResult) {
    if (queryResult == null) return null;

    return Move(queryResult.move?.name);
  }
}
