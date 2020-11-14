import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final PublishSubject<List<UserModel>> _usersFetcher = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get allUsers => _usersFetcher.stream;

  List<UserModel> users = <UserModel>[];

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = await Repository.getAllUsers();

    _usersFetcher.sink.add(allUsers);
    users = allUsers;
    debugPrint("Inviati al sink tutti gli utenti.");

    return allUsers;
  }

  void dispose() {
    _usersFetcher.close();
  }
}
