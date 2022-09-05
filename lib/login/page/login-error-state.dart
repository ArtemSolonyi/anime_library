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
      return 'Username must be longer than or equal to 3 characters';
    } else if (value.length > 18) {
      return 'Username must be less than or equal to 18 characters';
    } else if (value.isEmpty) {
      return 'Username must be blank';
    }
    return null;
  }

  @action
  String? validatePassword(String value) {
    if (value.length < 7) {
      return 'Password must be longer than or equal to 7 characters';
    } else if (value.isEmpty) {
      return 'Password must be blank';
    }
    return null;
  }

  @action
  String? validateEmail(String value) {
    if (value.length < 5) {
      return 'Email must be blank in format email';
    } else if (value.isEmpty) {
      return 'Email must be blank';
    } else if (!isEmail(value)) {
      return 'Email must be blank in format email';
    }
    return null;
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
