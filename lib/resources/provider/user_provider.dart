import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class UserProvider {
  /// Restituisce tutti gli utenti presenti nell'app.
  static Future<List<UserModel>> getAllUsers() async {
    List<DocumentSnapshot> rawUsers = (await References.usersCollection.get()).docs;

    List<UserModel> users = <UserModel>[];
    for (int index = 0; index < rawUsers.length; index++) users.add(_decodeUser(rawUsers.elementAt(index)));

    return users;
  }

  /// Restituisce un utente in base al suo [userUid], o null se questo non esiste.
  static Future<UserModel> getUserByUid(String userUid) async {
    DocumentSnapshot rawUser = await References.usersCollection.doc(userUid).get();

    if (!rawUser.exists) return null;

    return _decodeUser(rawUser);
  }

  /// Restituisce l'utente corrente.
  static Future<UserModel> getCurrentUser() async {
    String currentUserUid = FirebaseAuth.instance.currentUser.uid;
    if (currentUserUid == null) return null;

    return getUserByUid(currentUserUid);
  }

  static UserModel _decodeUser(DocumentSnapshot rawUser) {
    UserModel user = UserModel.fromJson(rawUser.data());
    user.reference = rawUser.reference;

    return user;
  }
}
