import 'package:hive/hive.dart';

import '../schemas/schema.graphql.dart';
import 'type_ids.dart';

part 'sprite.g.dart';

@HiveType(typeId: TypeId.sprite)
class Sprite {
  @HiveField(0)
  String? backDefault;

  @HiveField(1)
  String? backFemale;

  @HiveField(2)
  String? backShiny;

  @HiveField(3)
  String? backShinyFemale;

  @HiveField(4)
  String? frontDefault;

  @HiveField(5)
  String? frontFemale;

  @HiveField(6)
  String? frontShiny;

  @HiveField(7)
  String? frontShinyFemale;

  @override
  String toString() {
    return <String, dynamic>{
      "backDefault": backDefault,
      "backFemale": backFemale,
      "backShiny": backShiny,
      "backShinyFemale": backShinyFemale,
      "frontDefault": frontDefault,
      "frontFemale": frontFemale,
      "frontShiny": frontShiny,
      "frontShinyFemale": frontShinyFemale,
    }.toString();
  }

  Sprite({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  static Sprite? fromQueryResult(Query$pokemon$pokemon$sprites? queryResult) {
    if (queryResult == null) return null;

    return Sprite(
      backDefault: queryResult.back_default,
      backFemale: queryResult.back_female,
      backShiny: queryResult.back_shiny,
      backShinyFemale: queryResult.back_shiny_female,
      frontDefault: queryResult.front_default,
      frontFemale: queryResult.front_female,
      frontShiny: queryResult.front_shiny,
      frontShinyFemale: queryResult.front_shiny_female,
    );
  }
}
