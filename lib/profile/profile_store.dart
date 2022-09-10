import 'package:anime_library/repository/authentication.dart';
import 'package:mobx/mobx.dart';

import '../../locator/locator.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  late String username;
  @observable
  late String nickname;
  @observable
  late String email;
  @observable
  late bool pending;
  @action
  Future<void> getProfiles(String username) async {
    final getProfile =
        await getIt.get<AuthenticationRepository>().getProfile(username);
    getProfile
      ..onData((data) => print(data.username))
      ..onError((e) => print(e.statusCode));
  }
}
