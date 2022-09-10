import 'package:anime_library/repository/settings_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/authentication.dart';
import '../utils/network.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepository());
  getIt.registerFactoryAsync<SharedPreferences>(SharedPreferences.getInstance);
  getIt.registerLazySingleton<ValidationBuilder>(() => ValidationBuilder());
  getIt.registerLazySingleton<DioClient>(() => DioClient().addInterceptor());
}
