import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jeve_passmaster_flutter/generated/l10n.dart';
import 'package:jeve_passmaster_flutter/models/group_model.dart';
import 'package:jeve_passmaster_flutter/models/state_model.dart';
import 'package:jeve_passmaster_flutter/models/user_model.dart';
import 'package:jeve_passmaster_flutter/resources/helper/group_helper.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class GroupEditorScreen extends StatelessWidget {
  static const String route = "/groupEditorScreen";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GroupModel group;

  @override
  Widget build(BuildContext context) {
    if (group == null) {
      group = ModalRoute.of(context).settings.arguments as GroupModel;
      if (group == null) group = GroupModel(id: randomAlphaNumeric(20), creationDate: DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(title: Text(S.current.editGroup)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: S.current.name,
                      ),
                      initialValue: group.name,
                      validator: RequiredValidator(errorText: S.current.requiredError),
                      onSaved: (String value) => group.name = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: S.current.description,
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                      minLines: 4,
                      initialValue: group.description,
                      onSaved: (String value) => group.description = value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 8.0),
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.save),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    if (group.reference == null)
                      await GroupHelper.createGroup(group);
                    else
                      await GroupHelper.editGroup(group);

                    Provider.of<StateModel>(context, listen: false).groupBloc.getAllGroups(Provider.of<UserModel>(context, listen: false));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: ElevatedButton(
                child: Text(S.current.delete),
                onPressed: group.reference == null
                    ? null
                    : () async {
                        bool delete = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(S.current.deleteGroup),
                            content: Text(S.current.deleteGroupExtended),
                            actions: [
                              TextButton(child: Text(S.current.undo), onPressed: () => Navigator.of(context).pop(false)),
                              ElevatedButton(child: Text(S.current.delete), onPressed: () => Navigator.of(context).pop(true)),
                            ],
                          ),
                        );
                        if (delete) {
                          await GroupHelper.deleteGroup(group);
                          Provider.of<StateModel>(context, listen: false).groupBloc.getAllGroups(Provider.of<UserModel>(context, listen: false));
                          Navigator.of(context).pop();
                        }
                      },
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ],
    );
  }
}
