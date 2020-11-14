import 'package:jeve_passmaster_flutter/models/password_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class PasswordHelper {
  static Future<void> createPassword(PasswordModel password) => References.passwordsCollection.doc(password.id).set(password.toJson());

  static Future<void> editPassword(PasswordModel password) => References.passwordsCollection.doc(password.id).update(password.toJson());

  static Future<void> deletePassword(PasswordModel password) => References.passwordsCollection.doc(password.id).delete();
}
