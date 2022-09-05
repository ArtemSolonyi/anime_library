// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$pendingAtom =
      Atom(name: '_RegisterStore.pending', context: context);

  @override
  bool get pending {
    _$pendingAtom.reportRead();
    return super.pending;
  }

  @override
  set pending(bool value) {
    _$pendingAtom.reportWrite(value, super.pending, () {
      super.pending = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_RegisterStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom = Atom(name: '_RegisterStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_RegisterStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String error) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setError');
    try {
      return super.setError(error);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pending: ${pending},
username: ${username},
email: ${email},
password: ${password},
errorMessage: ${errorMessage}
    ''';
  }
}
