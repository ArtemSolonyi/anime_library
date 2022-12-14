// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  late final _$pendingAtom = Atom(name: '_FormStore.pending', context: context);

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
      Atom(name: '_FormStore.username', context: context);

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

  late final _$emailAtom = Atom(name: '_FormStore.email', context: context);

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
      Atom(name: '_FormStore.password', context: context);

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
      Atom(name: '_FormStore.errorMessage', context: context);

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

  late final _$statusCodeAtom =
      Atom(name: '_FormStore.statusCode', context: context);

  @override
  int get statusCode {
    _$statusCodeAtom.reportRead();
    return super.statusCode;
  }

  @override
  set statusCode(int value) {
    _$statusCodeAtom.reportWrite(value, super.statusCode, () {
      super.statusCode = value;
    });
  }

  late final _$tempKeyAtom = Atom(name: '_FormStore.tempKey', context: context);

  @override
  String get tempKey {
    _$tempKeyAtom.reportRead();
    return super.tempKey;
  }

  @override
  set tempKey(String value) {
    _$tempKeyAtom.reportWrite(value, super.tempKey, () {
      super.tempKey = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_FormStore.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$refreshTokenAsyncAction =
      AsyncAction('_FormStore.refreshToken', context: context);

  @override
  Future<void> refreshToken() {
    return _$refreshTokenAsyncAction.run(() => super.refreshToken());
  }

  late final _$activationEmailAsyncAction =
      AsyncAction('_FormStore.activationEmail', context: context);

  @override
  Future<void> activationEmail(String tempKey) {
    return _$activationEmailAsyncAction
        .run(() => super.activationEmail(tempKey));
  }

  late final _$registerAsyncAction =
      AsyncAction('_FormStore.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String error) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setError');
    try {
      return super.setError(error);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusCode(int statusCodes) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setStatusCode');
    try {
      return super.setStatusCode(statusCodes);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPending(bool pending) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setPending');
    try {
      return super.setPending(pending);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempkey(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setTempkey');
    try {
      return super.setTempkey(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pending: ${pending},
username: ${username},
email: ${email},
password: ${password},
errorMessage: ${errorMessage},
statusCode: ${statusCode},
tempKey: ${tempKey}
    ''';
  }
}
