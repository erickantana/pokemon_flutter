// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvolutionDetailAdapter extends TypeAdapter<EvolutionDetail> {
  @override
  final int typeId = 2;

  @override
  EvolutionDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvolutionDetail(
      gender: fields[0] as int?,
      heldItem: fields[1] as String?,
      item: fields[2] as String?,
      knownMove: fields[3] as String?,
      knownMoveType: fields[4] as String?,
      location: fields[5] as String?,
      minAffection: fields[6] as int?,
      minBeauty: fields[7] as int?,
      minHappiness: fields[8] as int?,
      minLevel: fields[9] as int?,
      needsOverworldRain: fields[10] as bool?,
      partySpecies: fields[11] as String?,
      partyType: fields[12] as String?,
      relativePhysicalStats: fields[13] as int?,
      timeOfDay: fields[14] as String?,
      tradeSpecies: fields[15] as String?,
      trigger: fields[16] as String?,
      turnUpsideDown: fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, EvolutionDetail obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.heldItem)
      ..writeByte(2)
      ..write(obj.item)
      ..writeByte(3)
      ..write(obj.knownMove)
      ..writeByte(4)
      ..write(obj.knownMoveType)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.minAffection)
      ..writeByte(7)
      ..write(obj.minBeauty)
      ..writeByte(8)
      ..write(obj.minHappiness)
      ..writeByte(9)
      ..write(obj.minLevel)
      ..writeByte(10)
      ..write(obj.needsOverworldRain)
      ..writeByte(11)
      ..write(obj.partySpecies)
      ..writeByte(12)
      ..write(obj.partyType)
      ..writeByte(13)
      ..write(obj.relativePhysicalStats)
      ..writeByte(14)
      ..write(obj.timeOfDay)
      ..writeByte(15)
      ..write(obj.tradeSpecies)
      ..writeByte(16)
      ..write(obj.trigger)
      ..writeByte(17)
      ..write(obj.turnUpsideDown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvolutionDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
