import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:jeve_passmaster_flutter/resources/provider/password_provider.dart';

class GroupProvider {
  /// Restituisce una lista di gruppi e password per l'utente [currentUser].
  static Future<List<GroupModel>> getAllAccessibleGroups(UserModel currentUser) async {
    if (currentUser.role != UserRole.READ_ONLY) {
      List<DocumentSnapshot> rawGroups = (await References.groupsCollection.get()).docs;

      List<GroupModel> groups = <GroupModel>[];
      for (int index = 0; index < rawGroups.length; index++) {
        GroupModel group = GroupModel.fromJson(rawGroups.elementAt(index).data());
        group.reference = rawGroups.elementAt(index).reference;

        group.passwords = await PasswordProvider.getPasswordByGroup(group.id);

        groups.add(group);
      }

      return groups;
    } else {
      List<GroupModel> groups = <GroupModel>[];
      for (int index = 0; index < currentUser.enabledGroups.length; index++) {
        DocumentSnapshot rawGroup = await References.groupsCollection.doc(currentUser.enabledGroups.elementAt(index)).get();
        if (rawGroup.exists) {
          GroupModel group = GroupModel.fromJson(rawGroup.data());
          group.reference = rawGroup.reference;

          group.passwords = await PasswordProvider.getPasswordByGroup(group.id);

          groups.add(group);
        }
      }

      return groups;
    }
  }
}
