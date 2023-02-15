// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_version.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EncounterVersionAdapter extends TypeAdapter<EncounterVersion> {
  @override
  final int typeId = 10;

  @override
  EncounterVersion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EncounterVersion(
      fields[0] as String?,
      fields[1] as int?,
      (fields[2] as List?)?.cast<EncounterDetail?>(),
    );
  }

  @override
  void write(BinaryWriter writer, EncounterVersion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.maxChance)
      ..writeByte(2)
      ..write(obj.encounterDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EncounterVersionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
