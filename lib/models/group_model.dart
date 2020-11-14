import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jeve_passmaster_flutter/models/password_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable()
class GroupModel {
  String id;
  String name, description;
  DateTime creationDate;

  @JsonKey(ignore: true)
  List<PasswordModel> passwords;

  @JsonKey(ignore: true)
  DocumentReference reference;

  GroupModel({
    this.id,
    this.name,
    this.description,
    this.creationDate,
  });

  @override
  String toString() => "Gruppo $name.";

  factory GroupModel.fromJson(Map<String, dynamic> parsedJson) => _$GroupModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);
}
