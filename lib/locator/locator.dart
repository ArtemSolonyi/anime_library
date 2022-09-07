import 'package:get_it/get_it.dart';
import 'package:form_validator/form_validator.dart';

import '../repository/authentication.dart';
import '../utils/network.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<ValidationBuilder>(() => ValidationBuilder());
}
