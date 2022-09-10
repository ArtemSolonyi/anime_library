import 'package:mobx/mobx.dart';

import '../login/page/login-error-state.dart';

part 'settings_error_store.g.dart';

class SettingsErrorStore = _SettingsErrorStore with _$SettingsErrorStore;

abstract class _SettingsErrorStore with Store {
  @observable
  String errorEmailForChangePassword = ' ';
  @observable
  String validateFirstPassword = '';
  @observable
  String passwordConfirmation = '';
  @observable
  String confirmationPassword = '';
  @computed
  bool get isConfirmationPassword {
    return validateFirstPassword == passwordConfirmation;
  }

  @action
  setFirstPassword(String value) {
    validateFirstPassword = value;
  }

  @action
  setPasswordConfirmation(String value) {
    passwordConfirmation = value;
  }

  @action
  validateEmail(String value) {
    print('$value value');
    if (value.length < 5) {
      errorEmailForChangePassword = 'Email must be blank in format email';
    } else if (value.isEmpty) {
      errorEmailForChangePassword = 'Email must be blank';
    } else if (!isEmail(value)) {
      errorEmailForChangePassword = 'Email must be blank in format email';
    } else {
      errorEmailForChangePassword = '';
    }
  }
}
