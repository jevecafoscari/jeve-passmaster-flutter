import 'package:flutter/material.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/login_screen.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(References.appName)),
      drawer: _buildDrawer(context),
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
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text("CIAO"),
              ],
            ),
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
