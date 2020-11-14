import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/group_editor_screen.dart';
import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/models/state_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:provider/provider.dart';

class GroupPage extends StatelessWidget {
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
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(groupsSnapshot.data.elementAt(index).name),
                trailing: Text(groupsSnapshot.data.elementAt(index).passwords.length.toString()),
                onTap: () => Navigator.of(context).pushNamed(GroupEditorScreen.route, arguments: groupsSnapshot.data.elementAt(index)),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
