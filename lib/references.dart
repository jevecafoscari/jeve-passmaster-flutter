import 'package:cloud_firestore/cloud_firestore.dart';

class References {
  static const String appName = "JEVE Passmaster";

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
}
