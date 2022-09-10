import 'package:anime_library/repository/settings_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/authentication-response.dto.dart';
import '../dtos/tokens.dto.dart';
import '../locator/locator.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  String emailForChangePassword = '';
  @observable
  int statusCode = 0;
  @observable
  String errorMessage = '';
  @observable
  String message = '';
  @observable
  bool passwordSuccessfullyChanged = false;
  @observable
  bool accessToChangePassword = false;
  @action
  void setAccessToChangePassword(bool value) {
    accessToChangePassword = value;
  }

  @action
  void setPasswordSuccessChange() {
    passwordSuccessfullyChanged = true;
  }

  @action
  void setError(String value) {
    errorMessage = value;
  }

  @action
  void setStatusCode(int value) {
    statusCode = value;
  }

  @action
  void setMessage(String value) {
    message = value;
  }

  @action
  Future<void> changePassword(String newPassword) async {
    final sendPinCodeForChange = await getIt
        .get<SettingsRepository>()
        .changePassword(emailForChangePassword, newPassword);
    sendPinCodeForChange
      ..onData((data) async {
        await setTokensAndSetStatusCode(data, 200);
        setPasswordSuccessChange();
      })
      ..onError((error) => setError(error.message));
  }

  Future<void> setTokensAndSetStatusCode(
      AuthenticationResponse data, int statusCode) async {
    setTokens(data.tokens);
    setStatusCode(statusCode);
  }

  Future<void> setTokens(Tokens data) async {
    SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
    prefs.setString('accessToken', data.accessToken);
    prefs.setString('refreshToken', data.refreshToken);
  }

  @action
  Future<void> sendPinCodeForChange(int pinCode) async {
    final sendPinCodeForChange = await getIt
        .get<SettingsRepository>()
        .sendingPinCodeForChange(emailForChangePassword, pinCode);
    sendPinCodeForChange
      ..onData((data) => setMessage(data.message))
      ..onError((error) => setErrorMessage(error.message));
  }

  @action
  void setEmail(String value) {
    emailForChangePassword = value;
  }

  @action
  void setErrorMessage(String value) {
    errorMessage = value;
  }

  @action
  Future<void> requestOnChangePassword() async {
    final resultOfRequestOnChangedPassword = await getIt
        .get<SettingsRepository>()
        .requestOnChangePassword(emailForChangePassword);
    resultOfRequestOnChangedPassword
      ..onData((data) => setStatusCode(data.statusCode))
      ..onError((error) => setErrorMessage(error.message));
  }
}
