import 'package:anime_library/repository/authentication.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    statusCode = statusCodes;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  Future<void> login() async {
    pending = true;
    setError('');
    final loginData = await getIt
        .get<AuthenticationRepository>()
        .loginUser(username, password);
    loginData
      ..onData((data) async => await setTokens(data.tokens))
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
      // ..onData((data) async => await setStatusCode(data.statusCode))
      ..onError((error) => setError(error.message));
    pending = false;
  }

  Future<void> setTokens(Tokens data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', data.accessToken);
    prefs.setString('refreshToken', data.refreshToken);
  }
}
