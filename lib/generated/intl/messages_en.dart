// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "admin" : MessageLookupByLibrary.simpleMessage("Admin"),
    "adminExtended" : MessageLookupByLibrary.simpleMessage("Can manage passwords and create new users"),
    "credential" : MessageLookupByLibrary.simpleMessage("Email / username"),
    "delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "editGroup" : MessageLookupByLibrary.simpleMessage("Edit group"),
    "editPassword" : MessageLookupByLibrary.simpleMessage("Edit password"),
    "editUser" : MessageLookupByLibrary.simpleMessage("Edit user"),
    "editor" : MessageLookupByLibrary.simpleMessage("Editor"),
    "editorExtended" : MessageLookupByLibrary.simpleMessage("Can see all the passwords and create new password or groups"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "groups" : MessageLookupByLibrary.simpleMessage("Groups"),
    "invalidEmail" : MessageLookupByLibrary.simpleMessage("Insert a valid email"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginError" : MessageLookupByLibrary.simpleMessage("Invalid email / password"),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "noData" : MessageLookupByLibrary.simpleMessage("No data in this field"),
    "note" : MessageLookupByLibrary.simpleMessage("Note"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "passwords" : MessageLookupByLibrary.simpleMessage("Passwords"),
    "readOnly" : MessageLookupByLibrary.simpleMessage("Read only"),
    "readOnlyExtended" : MessageLookupByLibrary.simpleMessage("Can only see password of the assigned groups"),
    "requiredError" : MessageLookupByLibrary.simpleMessage("This field cannot be empty"),
    "requiredGroup" : MessageLookupByLibrary.simpleMessage("Set at least a group for this password"),
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "superAdmin" : MessageLookupByLibrary.simpleMessage("Super admin"),
    "superAdminExtended" : MessageLookupByLibrary.simpleMessage("There\'s only one, and he\'s the chosen one"),
    "surname" : MessageLookupByLibrary.simpleMessage("Surname"),
    "users" : MessageLookupByLibrary.simpleMessage("Users"),
    "weakPassword" : MessageLookupByLibrary.simpleMessage("The password must has at least 8 characters")
  };
}
