import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/helper/profile_helper.dart';

class AuthHelper {
  /// Crea un nuovo utente con [email] e [password].
  static Future<bool> createUserWithEmailAndPassword(UserModel user, String password) async {
    try {
      // Creiamo l'utente nel provider di autenticazione e ne otteniamo l'[uid].
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: password);
      user.uid = credential.user.uid;
      debugPrint("Creato con successo l'utente ${user.uid}.");

      return await ProfileHelper.setUserData(user);
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  /// Esegue l'accesso al provider di autenticazione con [email] e [password].
  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  /// Effettua il logout dell'utente corrente.
  static Future<void> logout() async => await FirebaseAuth.instance.signOut();
}
