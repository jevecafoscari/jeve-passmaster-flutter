import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';

class GroupHelper {
  static Future<void> createGroup(GroupModel group) => References.groupsCollection.doc(group.id).set(group.toJson());

  static Future<void> editGroup(GroupModel group) => References.groupsCollection.doc(group.id).set(group.toJson());

  static Future<void> deleteGroup(GroupModel group) => References.groupsCollection.doc(group.id).set(group.toJson());
}
