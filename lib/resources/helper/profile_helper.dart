import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class ProfileHelper {
  /// Aggiorna i dati del profilo.
  static Future<bool> setUserData(UserModel user) async {
    assert(user.uid != null);

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
