import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GroupBloc {
  final PublishSubject<List<GroupModel>> _groupsFetcher = PublishSubject<List<GroupModel>>();

  Stream<List<GroupModel>> get allGroups => _groupsFetcher.stream;

  List<GroupModel> groups = <GroupModel>[];

  Future<List<GroupModel>> getAllGroups(UserModel currentUser) async {
    List<GroupModel> allAccessibleGroups = await Repository.getAllAccessibleGroups(currentUser);

    _groupsFetcher.sink.add(allAccessibleGroups);
    groups = allAccessibleGroups;
    debugPrint("Inviate al sink tutte le richieste.");

    return allAccessibleGroups;
  }

  void dispose() {
    _groupsFetcher.close();
  }
}
