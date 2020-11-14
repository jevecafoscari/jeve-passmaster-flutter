import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeve_passmaster_flutter/interface/screen/home_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/login_screen.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((onPostFrame) async {
      try {
        await Future.delayed(Duration(seconds: 2));

        await Firebase.initializeApp();
        await Provider.of<UserModel>(context, listen: false).updateUser();

        Navigator.of(context).pushReplacementNamed(HomeScreen.route);
        return;
      } catch (e) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        return;
      }
    });

    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(References.appName, style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).accentColor)),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
