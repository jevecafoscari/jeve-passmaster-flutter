import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/password_editor_screen.dart';
import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/models/password_model.dart';
import 'package:jeve_passmaster_flutter/models/state_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  Set<String> visiblePasswords = Set<String>();

  @override
  Widget build(BuildContext context) {
    Provider.of<StateModel>(context, listen: false).groupBloc.getAllGroups(Provider.of<UserModel>(context, listen: false));

    return RefreshIndicator(
      onRefresh: () => Provider.of<StateModel>(context, listen: false).groupBloc.getAllGroups(Provider.of<UserModel>(context, listen: false)),
      child: StreamBuilder<List<GroupModel>>(
        stream: Provider.of<StateModel>(context, listen: false).groupBloc.allGroups,
        builder: (BuildContext context, AsyncSnapshot<List<GroupModel>> groupsSnapshot) {
          if (groupsSnapshot.hasData) {
            if (groupsSnapshot.data.isEmpty) return Center(child: Text(S.current.noData));

            return ListView.builder(
              itemCount: groupsSnapshot.data.length,
              itemBuilder: (BuildContext context, int index) => ExpansionTile(
                title: Text(groupsSnapshot.data.elementAt(index).name),
                subtitle: Text(groupsSnapshot.data.elementAt(index).description),
                trailing: Text(groupsSnapshot.data.elementAt(index).passwords.length.toString()),
                children: groupsSnapshot.data
                    .elementAt(index)
                    .passwords
                    .map((PasswordModel password) => ListTile(
                          title: Text(password.service),
                          subtitle: Text(password.email + " / " + (visiblePasswords.contains(password.id) ? password.password : "********")),
                          onTap: () => Navigator.of(context).pushNamed(PasswordEditorScreen.route, arguments: password),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () => setState(() => visiblePasswords.contains(password.id) ? visiblePasswords.remove(password.id) : visiblePasswords.add(password.id)),
                          ),
                        ))
                    .toList(),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
