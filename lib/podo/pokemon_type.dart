import 'package:hive/hive.dart';

import '../schemas/schema.graphql.dart';
import 'type_ids.dart';

part 'pokemon_type.g.dart';

@HiveType(typeId: TypeId.pokemonType)
class PokemonType {
  @HiveField(0)
  String? name;

  @override
  String toString() {
    return {"name": name}.toString();
  }

  PokemonType(this.name);

  static PokemonType? fromQueryResult(Query$pokemon$pokemon$types? queryResult) {
    if (queryResult == null) return null;

    return PokemonType(queryResult.type?.name);
  }
}
