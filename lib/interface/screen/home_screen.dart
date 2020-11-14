import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/pages/group_page.dart';
import 'package:jeve_passmaster_flutter/interface/pages/password_page.dart';
import 'package:jeve_passmaster_flutter/interface/pages/user_page.dart';
import 'package:jeve_passmaster_flutter/interface/screen/group_editor_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/login_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/password_editor_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/user_editor_screen.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(References.appName)),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> children = <Widget>[PasswordPage()];

    if (Provider.of<UserModel>(context).role != UserRole.READ_ONLY) children.addAll(<Widget>[GroupPage(), UserPage()]);

    return IndexedStack(index: _pageIndex, children: children);
  }

  FloatingActionButton _buildFloatingActionButton() {
    if (Provider.of<UserModel>(context, listen: false).role == UserRole.READ_ONLY) return null;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        if (_pageIndex == 0) Navigator.of(context).pushNamed(PasswordEditorScreen.route);
        if (_pageIndex == 1) Navigator.of(context).pushNamed(GroupEditorScreen.route);
        if (_pageIndex == 2) Navigator.of(context).pushNamed(UserEditorScreen.route);
      },
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Consumer<UserModel>(
            builder: (BuildContext context, UserModel currentUser, Widget child) => UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(currentUser.profilePictureUrl),
              ),
              accountName: Text(currentUser.displayName),
              accountEmail: Text(currentUser.email),
            ),
          ),
          ListTile(
            title: Text(S.current.password),
            onTap: () {
              setState(() => _pageIndex = 0);
              Navigator.of(context).pop();
            },
          ),
          if (Provider.of<UserModel>(context).role != UserRole.READ_ONLY) ...[
            ListTile(
              title: Text(S.current.groups),
              onTap: () {
                setState(() => _pageIndex = 1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(S.current.users),
              onTap: () {
                setState(() => _pageIndex = 2);
                Navigator.of(context).pop();
              },
            ),
          ],
          Spacer(),
          Divider(
            height: 0.0,
          ),
          ListTile(
            title: Text(S.current.logout),
            onTap: () async {
              await Provider.of<UserModel>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(LoginScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
