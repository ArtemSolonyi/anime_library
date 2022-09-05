import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
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

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setError(String error) {
    errorMessage = error;
  }
}
