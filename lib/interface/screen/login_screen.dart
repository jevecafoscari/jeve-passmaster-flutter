import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/interface/screen/home_screen.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/helper/auth_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inAsyncCall = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.login)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AutofillGroup(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email),
                    labelText: S.current.email,
                  ),
                  autofillHints: [AutofillHints.newUsername, AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: EmailValidator(errorText: S.current.invalidEmail),
                  onSaved: (String value) => email = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: S.current.password,
                  ),
                  autofillHints: [AutofillHints.newPassword],
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (String value) => password = value,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text(S.current.login),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      setState(() => inAsyncCall = true);
                      bool loginSuccessful = await AuthHelper.signInWithEmailAndPassword(email, password);
                      if (!loginSuccessful) {
                        setState(() => inAsyncCall = false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.current.loginError)));
                      } else {
                        await Provider.of<UserModel>(context, listen: false).updateUser();
                        Navigator.of(context).pushReplacementNamed(HomeScreen.route);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
