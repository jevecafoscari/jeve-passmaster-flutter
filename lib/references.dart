import 'package:cloud_firestore/cloud_firestore.dart';

class References {
  static const String appName = "JEVE Passmaster";

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

  static const String defaultUserAvatarUrl =
      "https://firebasestorage.googleapis.com/v0/b/jeve-passmaster-flutter.appspot.com/o/utility%2FuserAvatar.png?alt=media&token=516e8be0-116f-474b-8174-7dca28874673";
}
