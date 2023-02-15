// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EncounterAdapter extends TypeAdapter<Encounter> {
  @override
  final int typeId = 9;

  @override
  Encounter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Encounter(
      fields[0] as Location?,
      (fields[1] as List?)?.cast<EncounterVersion?>(),
    );
  }

  @override
  void write(BinaryWriter writer, Encounter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.encounterVersions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EncounterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
