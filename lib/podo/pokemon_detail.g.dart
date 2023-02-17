// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonDetailAdapter extends TypeAdapter<PokemonDetail> {
  @override
  final int typeId = 5;

  @override
  PokemonDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonDetail(
      id: fields[0] as int?,
      name: fields[1] as String?,
      sprites: fields[2] as Sprite?,
      encounters: (fields[3] as List?)?.cast<Encounter?>(),
      height: fields[4] as int?,
      weight: fields[5] as int?,
      speciesUrl: fields[6] as String?,
      stats: (fields[7] as List?)?.cast<Stat?>(),
      moves: (fields[8] as List?)?.cast<Move?>(),
      abilities: (fields[9] as List?)?.cast<Ability?>(),
      pokemonTypes: (fields[10] as List?)?.cast<PokemonType?>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonDetail obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sprites)
      ..writeByte(3)
      ..write(obj.encounters)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.speciesUrl)
      ..writeByte(7)
      ..write(obj.stats)
      ..writeByte(8)
      ..write(obj.moves)
      ..writeByte(9)
      ..write(obj.abilities)
      ..writeByte(10)
      ..write(obj.pokemonTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
