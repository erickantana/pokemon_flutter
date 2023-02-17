// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpeciesAdapter extends TypeAdapter<Species> {
  @override
  final int typeId = 14;

  @override
  Species read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Species(
      baseHappiness: fields[0] as int?,
      captureRate: fields[1] as int?,
      varieties: (fields[3] as List?)?.cast<String>(),
      evolutionChainUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Species obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.baseHappiness)
      ..writeByte(1)
      ..write(obj.captureRate)
      ..writeByte(2)
      ..write(obj.evolutionChainUrl)
      ..writeByte(3)
      ..write(obj.varieties);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeciesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
