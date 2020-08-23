// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_watchlist_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyWatchlistCardAdapter extends TypeAdapter<CurrencyWatchlistCard> {
  @override
  final int typeId = 0;

  @override
  CurrencyWatchlistCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyWatchlistCard(
      nameLeft: fields[0] as String,
      currencyLeft: fields[1] as String,
      imageLeft: fields[2] as String,
      nameRight: fields[3] as String,
      currencyRight: fields[4] as String,
      imageRight: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyWatchlistCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nameLeft)
      ..writeByte(1)
      ..write(obj.currencyLeft)
      ..writeByte(2)
      ..write(obj.imageLeft)
      ..writeByte(3)
      ..write(obj.nameRight)
      ..writeByte(4)
      ..write(obj.currencyRight)
      ..writeByte(5)
      ..write(obj.imageRight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyWatchlistCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
