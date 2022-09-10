import 'package:anime_library/repository/authentication.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dtos/authentication-response.dto.dart';
import '../../dtos/tokens.dto.dart';
import '../../locator/locator.dart';

part 'login-state.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  bool pending = false;
  @observable
  String username = '';
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String errorMessage = '';
  @observable
  int statusCode = 0;
  @observable
  String tempKey = '';

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setError(String error) {
    errorMessage = error;
  }

  @action
  void setStatusCode(int statusCodes) {
    print('status $statusCodes');
    statusCode = statusCodes;
  }

  @action
  void setPending(bool pending) {}

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setTempkey(String value) {
    tempKey = value;
  }

  @action
  Future<void> login() async {
    pending = true;
    setError('');
    final loginData = await getIt
        .get<AuthenticationRepository>()
        .loginUser(username, password);
    loginData
      ..onData((data) async => await setTokensAndSetStatusCode(data, 201))
      ..onError((error) => setError(error.message));
  }

  @action
  Future<void> refreshToken() async {
    pending = true;
  }

  @action
  Future<void> activationEmail(String tempKey) async {
    pending = true;
    setError('');
    final registerData =
        await getIt.get<AuthenticationRepository>().activationEmail(tempKey);
    registerData
      ..onData((data) async => await setTokensAndSetStatusCode(data, 200))
      ..onError((error) => setError(error.message));
    pending = false;
  }

  @action
  Future<void> register() async {
    pending = true;
    setError('');
    final registerData = await getIt
        .get<AuthenticationRepository>()
        .registerUser(username, email, password);
    registerData
      ..onData((data) => setStatusCode(data.statusCode))
      ..onError((error) => setError(error.message));
    pending = false;
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
}
