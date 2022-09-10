// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  late final _$emailForChangePasswordAtom =
      Atom(name: '_SettingsStore.emailForChangePassword', context: context);

  @override
  String get emailForChangePassword {
    _$emailForChangePasswordAtom.reportRead();
    return super.emailForChangePassword;
  }

  @override
  set emailForChangePassword(String value) {
    _$emailForChangePasswordAtom
        .reportWrite(value, super.emailForChangePassword, () {
      super.emailForChangePassword = value;
    });
  }

  late final _$statusCodeAtom =
      Atom(name: '_SettingsStore.statusCode', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_SettingsStore.errorMessage', context: context);

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

  late final _$messageAtom =
      Atom(name: '_SettingsStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$passwordSuccessfullyChangedAtom = Atom(
      name: '_SettingsStore.passwordSuccessfullyChanged', context: context);

  @override
  bool get passwordSuccessfullyChanged {
    _$passwordSuccessfullyChangedAtom.reportRead();
    return super.passwordSuccessfullyChanged;
  }

  @override
  set passwordSuccessfullyChanged(bool value) {
    _$passwordSuccessfullyChangedAtom
        .reportWrite(value, super.passwordSuccessfullyChanged, () {
      super.passwordSuccessfullyChanged = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_SettingsStore.changePassword', context: context);

  @override
  Future<void> changePassword(String newPassword) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(newPassword));
  }

  late final _$sendPinCodeForChangeAsyncAction =
      AsyncAction('_SettingsStore.sendPinCodeForChange', context: context);

  @override
  Future<void> sendPinCodeForChange(int pinCode) {
    return _$sendPinCodeForChangeAsyncAction
        .run(() => super.sendPinCodeForChange(pinCode));
  }

  late final _$requestOnChangePasswordAsyncAction =
      AsyncAction('_SettingsStore.requestOnChangePassword', context: context);

  @override
  Future<void> requestOnChangePassword() {
    return _$requestOnChangePasswordAsyncAction
        .run(() => super.requestOnChangePassword());
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

  @override
  void setPasswordSuccessChange() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setPasswordSuccessChange');
    try {
      return super.setPasswordSuccessChange();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusCode(int value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setStatusCode');
    try {
      return super.setStatusCode(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailForChangePassword: ${emailForChangePassword},
statusCode: ${statusCode},
errorMessage: ${errorMessage},
message: ${message},
passwordSuccessfullyChanged: ${passwordSuccessfullyChanged}
    ''';
  }
}
