// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EncounterDetailAdapter extends TypeAdapter<EncounterDetail> {
  @override
  final int typeId = 11;

  @override
  EncounterDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EncounterDetail(
      chance: fields[0] as int?,
      conditions: (fields[4] as List?)?.cast<String>(),
      maxLevel: fields[1] as int?,
      method: fields[3] as String?,
      minLevel: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EncounterDetail obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.chance)
      ..writeByte(1)
      ..write(obj.maxLevel)
      ..writeByte(2)
      ..write(obj.minLevel)
      ..writeByte(3)
      ..write(obj.method)
      ..writeByte(4)
      ..write(obj.conditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EncounterDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
