import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/password_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class PasswordProvider {
  /// Ottiene le password per un certo [groupId].
  static Future<List<PasswordModel>> getPasswordByGroup(String groupId) async {
    List<DocumentSnapshot> rawPasswords = (await References.passwordsCollection.where("groupIds", arrayContains: groupId).get()).docs;

    List<PasswordModel> passwords = <PasswordModel>[];
    rawPasswords.forEach((DocumentSnapshot rawPassword) {
      PasswordModel password = PasswordModel.fromJson(rawPassword.data());
      password.reference = rawPassword.reference;

      passwords.add(password);
    });

    debugPrint("Restituisco ${passwords.length} password nel gruppo $groupId.");
    return passwords;
  }
}
