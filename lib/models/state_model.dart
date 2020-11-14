import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/bloc/group_bloc.dart';
import 'package:jeve_passmaster_flutter/bloc/user_bloc.dart';

class StateModel extends ChangeNotifier {
  GroupBloc groupBloc = GroupBloc();
  UserBloc userBloc = UserBloc();
}
