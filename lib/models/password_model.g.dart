// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) {
  return PasswordModel(
    id: json['id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    note: json['note'] as String,
    creationDate: json['creationDate'] == null
        ? null
        : DateTime.parse(json['creationDate'] as String),
    groupIds: (json['groupIds'] as List)?.map((e) => e as String)?.toSet(),
  )..service = json['service'] as String;
}

Map<String, dynamic> _$PasswordModelToJson(PasswordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'email': instance.email,
      'password': instance.password,
      'note': instance.note,
      'creationDate': instance.creationDate?.toIso8601String(),
      'groupIds': instance.groupIds?.toList(),
    };
