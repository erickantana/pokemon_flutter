// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpriteAdapter extends TypeAdapter<Sprite> {
  @override
  final int typeId = 7;

  @override
  Sprite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sprite(
      backDefault: fields[0] as String?,
      backFemale: fields[1] as String?,
      backShiny: fields[2] as String?,
      backShinyFemale: fields[3] as String?,
      frontDefault: fields[4] as String?,
      frontFemale: fields[5] as String?,
      frontShiny: fields[6] as String?,
      frontShinyFemale: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sprite obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.backDefault)
      ..writeByte(1)
      ..write(obj.backFemale)
      ..writeByte(2)
      ..write(obj.backShiny)
      ..writeByte(3)
      ..write(obj.backShinyFemale)
      ..writeByte(4)
      ..write(obj.frontDefault)
      ..writeByte(5)
      ..write(obj.frontFemale)
      ..writeByte(6)
      ..write(obj.frontShiny)
      ..writeByte(7)
      ..write(obj.frontShinyFemale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
