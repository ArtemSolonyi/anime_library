import 'package:anime_library/repository/authentication.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dtos/authentication-response.dto.dart';
import '../../dtos/tokens.dto.dart';
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
  Future<void> getProfiles() async {
    final getProfile = await getIt.get<AuthenticationRepository>().getProfile();
  }
}
