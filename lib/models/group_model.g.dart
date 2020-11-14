// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return GroupModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    creationDate: json['creationDate'] == null
        ? null
        : DateTime.parse(json['creationDate'] as String),
  );
}

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'creationDate': instance.creationDate?.toIso8601String(),
    };
