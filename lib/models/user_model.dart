import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:jeve_passmaster_flutter/resources/helper/auth_helper.dart';
import 'package:jeve_passmaster_flutter/resources/provider/user_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends ChangeNotifier {
  String uid;
  String email, name, surname, photoUrl;
  DateTime creationDate;
  UserRole role;
  Set<String> enabledGroups;

  @JsonKey(ignore: true)
  DocumentReference reference;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.surname,
    this.photoUrl,
    this.creationDate,
    this.role,
    this.enabledGroups,
  });

  @override
  String toString() => "Utente $name $surname.";

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) => _$UserModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String get displayName => "$name $surname";

  String get profilePictureUrl => this.photoUrl ?? References.defaultUserAvatarUrl;

  /// Prende tutti i valori disponibili nel database per l'utente corrente e li assegna.
  Future<void> updateUser([UserModel newUser]) async {
    if (newUser == null) newUser = await UserProvider.getCurrentUser();

    this.uid = newUser.uid;
    this.email = newUser.email;
    this.name = newUser.name;
    this.surname = newUser.surname;
    this.photoUrl = newUser.photoUrl;
    this.creationDate = newUser.creationDate;
    this.role = newUser.role;
    this.enabledGroups = newUser.enabledGroups ?? <String>[];
    this.reference = newUser.reference;

    debugPrint("Aggiornato dal server l\'utente corrente.");
    notifyListeners();
  }

  Future<void> logout() async {
    await AuthHelper.logout();
  }
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
