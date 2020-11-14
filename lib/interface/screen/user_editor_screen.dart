import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/models/state_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/helper/user_helper.dart';
import 'package:provider/provider.dart';

class UserEditorScreen extends StatefulWidget {
  static const String route = "/userEditorScreen";

  @override
  _UserEditorScreenState createState() => _UserEditorScreenState();
}

class _UserEditorScreenState extends State<UserEditorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserModel user;
  bool isNewUser = false;
  String password;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      user = ModalRoute.of(context).settings.arguments as UserModel;
      if (user == null) {
        isNewUser = true;

        user = UserModel(
          email: "",
          name: "",
          surname: "",
          role: UserRole.READ_ONLY,
          enabledGroups: Set<String>(),
          creationDate: DateTime.now(),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(S.current.editUser)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: S.current.name),
                          initialValue: user.name,
                          validator: RequiredValidator(errorText: S.current.requiredError),
                          onSaved: (String value) => user.name = value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: S.current.surname),
                          initialValue: user.surname,
                          validator: RequiredValidator(errorText: S.current.requiredError),
                          onSaved: (String value) => user.surname = value,
                        ),
                        TextFormField(
                          enabled: isNewUser,
                          readOnly: !isNewUser,
                          decoration: InputDecoration(labelText: S.current.email),
                          initialValue: user.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: EmailValidator(errorText: S.current.invalidEmail),
                          onSaved: (String value) => user.email = value,
                        ),
                        TextFormField(
                          enabled: isNewUser,
                          readOnly: !isNewUser,
                          decoration: InputDecoration(labelText: S.current.password),
                          initialValue: isNewUser ? "" : "********",
                          validator: MinLengthValidator(8, errorText: S.current.weakPassword),
                          onSaved: (String value) => password = value,
                        ),
                      ],
                    ),
                  ),
                ),
                RadioListTile<UserRole>(
                  groupValue: user.role,
                  value: UserRole.READ_ONLY,
                  title: Text(S.current.readOnly),
                  subtitle: Text(S.current.readOnlyExtended),
                  onChanged: (UserRole value) => setState(() => user.role = value),
                ),
                RadioListTile<UserRole>(
                  groupValue: user.role,
                  value: UserRole.EDITOR,
                  title: Text(S.current.editor),
                  subtitle: Text(S.current.editor),
                  onChanged: (UserRole value) => setState(() => user.role = value),
                ),
                RadioListTile<UserRole>(
                  groupValue: user.role,
                  value: UserRole.ADMIN,
                  title: Text(S.current.admin),
                  subtitle: Text(S.current.adminExtended),
                  onChanged: (UserRole value) => setState(() => user.role = value),
                ),
                RadioListTile<UserRole>(
                  selected: false,
                  groupValue: user.role,
                  value: UserRole.SUPER_ADMIN,
                  title: Text(S.current.superAdmin),
                  subtitle: Text(S.current.superAdminExtended),
                  onChanged: null,
                ),
                if (user.role == UserRole.READ_ONLY)
                  Consumer<StateModel>(
                    builder: (BuildContext context, StateModel currentState, Widget child) => ListView.builder(
                      itemCount: Provider.of<StateModel>(context).groupBloc.groups.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => CheckboxListTile(
                        title: Text(currentState.groupBloc.groups.elementAt(index).name),
                        value: user.enabledGroups.contains(currentState.groupBloc.groups.elementAt(index).id),
                        onChanged: (bool newValue) => setState(() => newValue
                            ? user.enabledGroups.add(currentState.groupBloc.groups.elementAt(index).id)
                            : user.enabledGroups.remove(currentState.groupBloc.groups.elementAt(index).id)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          child: Text(S.current.save),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              if (isNewUser)
                await UserHelper.createUser(user, password);
              else
                await UserHelper.editUser(user);

              Provider.of<StateModel>(context, listen: false).userBloc.getAllUsers();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
