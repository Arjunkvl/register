// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_data_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceDataEntityAdapter extends TypeAdapter<PriceDataEntity> {
  @override
  final int typeId = 0;

  @override
  PriceDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceDataEntity(
      id: fields[0] as int,
      total: fields[3] as int,
      date: fields[1] as String,
      price: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PriceDataEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
