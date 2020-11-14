import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_model.g.dart';

@JsonSerializable()
class PasswordModel {
  String id;
  String service, email, password;
  String note;
  DateTime creationDate;
  List<String> groupIds;

  @JsonKey(ignore: true)
  DocumentReference reference;

  PasswordModel({
    this.id,
    this.email,
    this.password,
    this.note,
    this.creationDate,
    this.groupIds,
  });

  @override
  String toString() => "Password per $service.";

  factory PasswordModel.fromJson(Map<String, dynamic> parsedJson) => _$PasswordModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);
}
