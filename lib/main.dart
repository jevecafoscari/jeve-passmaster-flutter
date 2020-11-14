import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/home_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/login_screen.dart';
import 'package:jeve_passmaster_flutter/interface/screen/splash_screen.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/references.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Passmaster());
}

class Passmaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>(
      create: (BuildContext context) => UserModel(),
      builder: (BuildContext context, Widget child) => MaterialApp(
        title: References.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: <LocalizationsDelegate>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: kIsWeb ? LoginScreen.route : SplashScreen.route,
        routes: <String, Widget Function(BuildContext)>{
          SplashScreen.route: (BuildContext context) => SplashScreen(),
          LoginScreen.route: (BuildContext context) => LoginScreen(),
          HomeScreen.route: (BuildContext context) => HomeScreen(),
        },
      ),
    );
  }
}
