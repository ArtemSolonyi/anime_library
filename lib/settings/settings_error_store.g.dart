// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsErrorStore on _SettingsErrorStore, Store {
  Computed<bool>? _$isConfirmationPasswordComputed;

  @override
  bool get isConfirmationPassword => (_$isConfirmationPasswordComputed ??=
          Computed<bool>(() => super.isConfirmationPassword,
              name: '_SettingsErrorStore.isConfirmationPassword'))
      .value;

  late final _$errorEmailForChangePasswordAtom = Atom(
      name: '_SettingsErrorStore.errorEmailForChangePassword',
      context: context);

  @override
  String get errorEmailForChangePassword {
    _$errorEmailForChangePasswordAtom.reportRead();
    return super.errorEmailForChangePassword;
  }

  @override
  set errorEmailForChangePassword(String value) {
    _$errorEmailForChangePasswordAtom
        .reportWrite(value, super.errorEmailForChangePassword, () {
      super.errorEmailForChangePassword = value;
    });
  }

  late final _$validateFirstPasswordAtom =
      Atom(name: '_SettingsErrorStore.validateFirstPassword', context: context);

  @override
  String get validateFirstPassword {
    _$validateFirstPasswordAtom.reportRead();
    return super.validateFirstPassword;
  }

  @override
  set validateFirstPassword(String value) {
    _$validateFirstPasswordAtom.reportWrite(value, super.validateFirstPassword,
        () {
      super.validateFirstPassword = value;
    });
  }

  late final _$passwordConfirmationAtom =
      Atom(name: '_SettingsErrorStore.passwordConfirmation', context: context);

  @override
  String get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  late final _$confirmationPasswordAtom =
      Atom(name: '_SettingsErrorStore.confirmationPassword', context: context);

  @override
  String get confirmationPassword {
    _$confirmationPasswordAtom.reportRead();
    return super.confirmationPassword;
  }

  @override
  set confirmationPassword(String value) {
    _$confirmationPasswordAtom.reportWrite(value, super.confirmationPassword,
        () {
      super.confirmationPassword = value;
    });
  }

  late final _$_SettingsErrorStoreActionController =
      ActionController(name: '_SettingsErrorStore', context: context);

  @override
  dynamic setFirstPassword(String value) {
    final _$actionInfo = _$_SettingsErrorStoreActionController.startAction(
        name: '_SettingsErrorStore.setFirstPassword');
    try {
      return super.setFirstPassword(value);
    } finally {
      _$_SettingsErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordConfirmation(String value) {
    final _$actionInfo = _$_SettingsErrorStoreActionController.startAction(
        name: '_SettingsErrorStore.setPasswordConfirmation');
    try {
      return super.setPasswordConfirmation(value);
    } finally {
      _$_SettingsErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String value) {
    final _$actionInfo = _$_SettingsErrorStoreActionController.startAction(
        name: '_SettingsErrorStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SettingsErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorEmailForChangePassword: ${errorEmailForChangePassword},
validateFirstPassword: ${validateFirstPassword},
passwordConfirmation: ${passwordConfirmation},
confirmationPassword: ${confirmationPassword},
isConfirmationPassword: ${isConfirmationPassword}
    ''';
  }
}
