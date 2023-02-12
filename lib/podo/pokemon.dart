import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0, adapterName: "PokemonAdapter")
class Pokemon extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? image;
}
