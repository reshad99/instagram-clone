// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      username: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      image: fields[4] as dynamic,
      followerCount: fields[5] as int?,
      followCount: fields[6] as int?,
      postCount: fields[7] as int?,
      thumbnailImage: fields[8] as dynamic,
      followed: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.followerCount)
      ..writeByte(6)
      ..write(obj.followCount)
      ..writeByte(7)
      ..write(obj.postCount)
      ..writeByte(8)
      ..write(obj.thumbnailImage)
      ..writeByte(9)
      ..write(obj.followed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
