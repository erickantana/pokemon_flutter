// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvolutionChainAdapter extends TypeAdapter<EvolutionChain> {
  @override
  final int typeId = 1;

  @override
  EvolutionChain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvolutionChain(
      evolutionDetail: (fields[1] as List?)?.cast<EvolutionDetail?>(),
      evolveTo: (fields[2] as List?)?.cast<EvolutionChain?>(),
      id: fields[0] as int?,
      speciesName: fields[3] as String?,
      speciesUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EvolutionChain obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.evolutionDetail)
      ..writeByte(2)
      ..write(obj.evolveTo)
      ..writeByte(3)
      ..write(obj.speciesName)
      ..writeByte(4)
      ..write(obj.speciesUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvolutionChainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
