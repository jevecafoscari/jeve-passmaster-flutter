import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "/loginScreen";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.login)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    String email, password;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              labelText: S.current.email,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: EmailValidator(errorText: S.current.invalidEmail),
            onSaved: (String value) => email = value,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.vpn_key),
              labelText: S.current.password,
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onSaved: (String value) => email = value,
          ),
          ElevatedButton(
            child: Text(S.current.login),
            onPressed: () {
              if (_formKey.currentState.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
