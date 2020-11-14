import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String uid;
  String email, name, surname, photoUrl;
  DateTime creationDate;
  UserRole role;
  List<String> enabledGroups;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.surname,
    this.role,
    this.enabledGroups,
  });

  @override
  String toString() => "Utente $name $surname.";

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) => _$UserModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

enum UserRole {
  // Come [ADMIN] ma non può essere cancellato.
  SUPER_ADMIN,
  // Può leggere e scrivere le password, creare nuovi utenti e assegnare loro un ruolo.
  ADMIN,
  // Può leggere le password e scriverne di nuove.
  EDITOR,
  // Può solo leggere le password.
  READ_ONLY,
}
