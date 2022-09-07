import 'package:mobx/mobx.dart';

part 'login-error-state.g.dart';

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;
  @observable
  String? error;

  @action
  String? validateUsername(String value) {
    if (value.length < 3) {
      username = 'Username must be longer than or equal to 3 characters';
    } else if (value.length > 18) {
      username = 'Username must be less than or equal to 18 characters';
    } else if (value.isEmpty) {
      username = 'Username must be blank';
    } else {
      username = "";
    }
  }

  @action
  String? validatePassword(String value) {
    if (value.length < 7) {
      password = 'Password must be longer than or equal to 7 characters';
    } else if (value.isEmpty) {
      password = 'Password must be blank';
    } else {
      password = "";
    }
  }

  @action
  bool validateStore() {
    return password == "" && username == "";
  }

  @action
  bool validateRegisterStore() {
    return password == "" && email == "" && username == "";
  }

  @action
  String? validateEmail(String value) {
    if (value.length < 5) {
      email = 'Email must be blank in format email';
    } else if (value.isEmpty) {
      email = 'Email must be blank';
    } else if (!isEmail(value)) {
      email = 'Email must be blank in format email';
    } else {
      email = "";
    }
  }

  @action
  String? setError(String error) {
    error = error;
  }
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}
