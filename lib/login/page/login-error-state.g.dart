// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-error-state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormErrorState on _FormErrorState, Store {
  late final _$usernameAtom =
      Atom(name: '_FormErrorState.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorState.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_FormErrorState.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_FormErrorStateActionController =
      ActionController(name: '_FormErrorState', context: context);

  @override
  String? validateUsername(String value) {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String value) {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String value) {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? setError(String error) {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.setError');
    try {
      return super.setError(error);
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password},
error: ${error}
    ''';
  }
}
