import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class UserHelper {
  /// Crea un utente fornito l'UserModel [user] e la [password].
  static Future<bool> createUser(UserModel user, String password) async {
    try {
      // Con queste due linee facciamo la magia.
      FirebaseApp secondaryFirebaseApp = await Firebase.initializeApp(
        name: "Seconday",
        options: Firebase.app().options,
      );
      UserCredential credential = await FirebaseAuth.instanceFor(app: secondaryFirebaseApp).createUserWithEmailAndPassword(email: user.email, password: password);

      user.uid = credential.user.uid;

      await References.usersCollection.doc(user.uid).set(user.toJson());

      debugPrint("Creato l\'account per ${user.email}.");
      return true;
    } catch (e) {
      debugPrint(e);

      return false;
    }
  }

  static Future<void> editUser(UserModel user) => References.usersCollection.doc(user.uid).update(user.toJson());

  static Future<void> deleteUser(UserModel user) => References.usersCollection.doc(user.uid).delete();
}
