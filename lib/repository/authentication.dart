import '../dtos/authentication-response.dto.dart';
import '../dtos/error_dto.dart';
import '../dtos/registration-response.dto.dart';
import '../utils/network.dart';

class AuthenticationRepository {
  Future<Result<AuthenticationResponse, ErrorDto>> loginUser(
      String username, String password) async {
    final result = await request<AuthenticationResponse, ErrorDto>(
      makeRequest: (dio) => dio.post(
        'http://localhost:6004/api/v1/auth/login',
        data: {"login": username, "password": password},
      ),
      onSuccess: (response) => AuthenticationResponse.fromJson(response.data),
      onError: (error) => ErrorDto.fromJson(error.response?.data),
    );
    return result
      ..onData((data) => print('success ${data.tokens.accessToken}'))
      ..onError((error) => print('error ${error.message}'));
  }

  Future<Result<RegistrationResponse, ErrorDto>> registerUser(
      String username, String email, String password) async {
    final result = await request<RegistrationResponse, ErrorDto>(
        makeRequest: (dio) => dio.post(
            'http://localhost:6004/api/v1/auth/registration',
            data: {"username": username, "email": email, "password": password}),
        onSuccess: (response) => RegistrationResponse.fromJson(response.data),
        onError: (error) => ErrorDto.fromJson(error.response?.data));
    return result
      ..onData((data) => print('success ${data.statusCode}'))
      ..onError((error) => print('error ${error.message}'));
  }
}
