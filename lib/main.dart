import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/login_screen.dart';
import 'package:jeve_passmaster_flutter/references.dart';

void main() {
  runApp(Passmaster());
}

class Passmaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: LoginScreen.route,
      routes: <String, Widget Function(BuildContext)>{
        LoginScreen.route: (BuildContext context) => LoginScreen(),
      },
    );
  }
}
