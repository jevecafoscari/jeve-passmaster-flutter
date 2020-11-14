import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/user_editor_screen.dart';
import 'package:jeve_passmaster_flutter/models/state_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<StateModel>(context, listen: false).userBloc.getAllUsers();

    return StreamBuilder<List<UserModel>>(
      stream: Provider.of<StateModel>(context, listen: false).userBloc.allUsers,
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> usersSnapshot) {
        if (usersSnapshot.hasData) {
          if (usersSnapshot.data.isEmpty) return Center(child: Text(S.current.noData));

          return ListView.builder(
            itemCount: usersSnapshot.data.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(usersSnapshot.data.elementAt(index).displayName),
              subtitle: Text(usersSnapshot.data.elementAt(index).email),
              onTap: () => Navigator.of(context).pushNamed(UserEditorScreen.route, arguments: usersSnapshot.data.elementAt(index)),
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
