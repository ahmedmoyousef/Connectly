// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneContactAdapter extends TypeAdapter<PhoneContact> {
  @override
  final int typeId = 0;

  @override
  PhoneContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneContact(
      phoneNumber: fields[0] as String,
      isFavorite: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneContact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.phoneNumber)
      ..writeByte(1)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
