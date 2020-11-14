// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    uid: json['uid'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    photoUrl: json['photoUrl'] as String,
    creationDate: json['creationDate'] == null
        ? null
        : DateTime.parse(json['creationDate'] as String),
    role: _$enumDecodeNullable(_$UserRoleEnumMap, json['role']),
    enabledGroups:
        (json['enabledGroups'] as List)?.map((e) => e as String)?.toSet(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'photoUrl': instance.photoUrl,
      'creationDate': instance.creationDate?.toIso8601String(),
      'role': _$UserRoleEnumMap[instance.role],
      'enabledGroups': instance.enabledGroups?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UserRoleEnumMap = {
  UserRole.SUPER_ADMIN: 'SUPER_ADMIN',
  UserRole.ADMIN: 'ADMIN',
  UserRole.EDITOR: 'EDITOR',
  UserRole.READ_ONLY: 'READ_ONLY',
};
