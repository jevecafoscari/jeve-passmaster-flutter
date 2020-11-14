// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Insert a valid email`
  String get invalidEmail {
    return Intl.message(
      'Insert a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email / password`
  String get loginError {
    return Intl.message(
      'Invalid email / password',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Passwords`
  String get passwords {
    return Intl.message(
      'Passwords',
      name: 'passwords',
      desc: '',
      args: [],
    );
  }

  /// `No data in this field`
  String get noData {
    return Intl.message(
      'No data in this field',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Edit group`
  String get editGroup {
    return Intl.message(
      'Edit group',
      name: 'editGroup',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get requiredError {
    return Intl.message(
      'This field cannot be empty',
      name: 'requiredError',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit password`
  String get editPassword {
    return Intl.message(
      'Edit password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email / username`
  String get credential {
    return Intl.message(
      'Email / username',
      name: 'credential',
      desc: '',
      args: [],
    );
  }

  /// `Set at least a group for this password`
  String get requiredGroup {
    return Intl.message(
      'Set at least a group for this password',
      name: 'requiredGroup',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Edit user`
  String get editUser {
    return Intl.message(
      'Edit user',
      name: 'editUser',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message(
      'Surname',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Read only`
  String get readOnly {
    return Intl.message(
      'Read only',
      name: 'readOnly',
      desc: '',
      args: [],
    );
  }

  /// `Can only see password of the assigned groups`
  String get readOnlyExtended {
    return Intl.message(
      'Can only see password of the assigned groups',
      name: 'readOnlyExtended',
      desc: '',
      args: [],
    );
  }

  /// `Editor`
  String get editor {
    return Intl.message(
      'Editor',
      name: 'editor',
      desc: '',
      args: [],
    );
  }

  /// `Can see all the passwords and create new password or groups`
  String get editorExtended {
    return Intl.message(
      'Can see all the passwords and create new password or groups',
      name: 'editorExtended',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Can manage passwords and create new users`
  String get adminExtended {
    return Intl.message(
      'Can manage passwords and create new users',
      name: 'adminExtended',
      desc: '',
      args: [],
    );
  }

  /// `Super admin`
  String get superAdmin {
    return Intl.message(
      'Super admin',
      name: 'superAdmin',
      desc: '',
      args: [],
    );
  }

  /// `There's only one, and he's the chosen one`
  String get superAdminExtended {
    return Intl.message(
      'There\'s only one, and he\'s the chosen one',
      name: 'superAdminExtended',
      desc: '',
      args: [],
    );
  }

  /// `The password must has at least 8 characters`
  String get weakPassword {
    return Intl.message(
      'The password must has at least 8 characters',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}