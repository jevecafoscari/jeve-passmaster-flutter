import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class AuthHelper {
  /// Crea un nuovo utente con [email] e [password].
  static Future<bool> createUserWithEmailAndPassword(UserModel user, String password) async {
    try {
      // Creiamo l'utente nel provider di autenticazione e ne otteniamo l'[uid].
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: password);
      user.uid = credential.user.uid;
      debugPrint("Creato con successo l'utente ${user.uid}.");

      return await setUserData(user);
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  /// Aggiorna i dati del profilo.
  static Future<bool> setUserData(UserModel user) async {
    try {
      await References.usersCollection.doc(user.uid).set(user.toJson());
      debugPrint("Aggiornati con successo i dati per $user.");

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }
}
