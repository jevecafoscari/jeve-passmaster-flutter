// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "admin" : MessageLookupByLibrary.simpleMessage("Amministratore"),
    "adminExtended" : MessageLookupByLibrary.simpleMessage("Può gestire tutte le password e creare nuovi utenti"),
    "credential" : MessageLookupByLibrary.simpleMessage("Email / username"),
    "delete" : MessageLookupByLibrary.simpleMessage("Elimina"),
    "deleteGroup" : MessageLookupByLibrary.simpleMessage("Elimina gruppo"),
    "deleteGroupExtended" : MessageLookupByLibrary.simpleMessage("Sei certo di voler eliminare questo gruppo?\nSaranno elimitate definitivamente anche tutte le password contenute."),
    "deletePassword" : MessageLookupByLibrary.simpleMessage("Elimina password"),
    "deletePasswordExtended" : MessageLookupByLibrary.simpleMessage("Sei certo di voler eliminare questa password?\nQuesta azione è irreversibile."),
    "description" : MessageLookupByLibrary.simpleMessage("Descrizione"),
    "editGroup" : MessageLookupByLibrary.simpleMessage("Modifica gruppo"),
    "editPassword" : MessageLookupByLibrary.simpleMessage("Modifica password"),
    "editUser" : MessageLookupByLibrary.simpleMessage("Modifica utente"),
    "editor" : MessageLookupByLibrary.simpleMessage("Editor"),
    "editorExtended" : MessageLookupByLibrary.simpleMessage("Può visualizzare tutte le password e creare nuove password e gruppi"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "groups" : MessageLookupByLibrary.simpleMessage("Gruppi"),
    "invalidEmail" : MessageLookupByLibrary.simpleMessage("Inserisci una email valida"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginError" : MessageLookupByLibrary.simpleMessage("L\'email o la password inserite non sono corrette"),
    "logout" : MessageLookupByLibrary.simpleMessage("Esci"),
    "name" : MessageLookupByLibrary.simpleMessage("Nome"),
    "noData" : MessageLookupByLibrary.simpleMessage("Nessun dato da mostrare"),
    "note" : MessageLookupByLibrary.simpleMessage("Note"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "passwords" : MessageLookupByLibrary.simpleMessage("Password"),
    "readOnly" : MessageLookupByLibrary.simpleMessage("Sola lettura"),
    "readOnlyExtended" : MessageLookupByLibrary.simpleMessage("Può solamente visualizzare le password dei gruppi che gli sono assegnati"),
    "requiredError" : MessageLookupByLibrary.simpleMessage("Questo campo non può essere lasciato vuoto"),
    "requiredGroup" : MessageLookupByLibrary.simpleMessage("Imposta almeno un gruppo per questa password"),
    "save" : MessageLookupByLibrary.simpleMessage("Salva"),
    "superAdmin" : MessageLookupByLibrary.simpleMessage("Super amministratore"),
    "superAdminExtended" : MessageLookupByLibrary.simpleMessage("Ce n\'è uno: l\'unico, il sommo"),
    "surname" : MessageLookupByLibrary.simpleMessage("Cognome"),
    "undo" : MessageLookupByLibrary.simpleMessage("Annulla"),
    "users" : MessageLookupByLibrary.simpleMessage("Utenti"),
    "weakPassword" : MessageLookupByLibrary.simpleMessage("La password deve avere almeno 8 caratteri")
  };
}
