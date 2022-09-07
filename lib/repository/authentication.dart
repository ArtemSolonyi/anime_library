import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/authentication-response.dto.dart';
import '../dtos/error_dto.dart';
import '../dtos/registration-response.dto.dart';
import '../dtos/tokens.dto.dart';
import '../utils/network.dart';

class AuthenticationRepository {
  Future<Result<AuthenticationResponse, ErrorDto>> loginUser(
      String username, String password) async {
    final result = await request<AuthenticationResponse, ErrorDto>(
      makeRequest: (dio) => dio.post(
        '/auth/login',
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
        makeRequest: (dio) => dio.post('/auth/registration',
            data: {"username": username, "email": email, "password": password}),
        onSuccess: (response) => RegistrationResponse.fromJson(response.data),
        onError: (error) => ErrorDto.fromJson(error.response?.data));
    print(result);
    return result
      ..onData((data) => print('success ${data.statusCode}'))
      ..onError((error) => print('error ${error.message}'));
  }

  Future<Result<RegistrationResponse, ErrorDto>> getProfile() async {
    final result = await request<RegistrationResponse, ErrorDto>(
        makeRequest: (dio) => dio.get('/'),
        onSuccess: (response) => RegistrationResponse.fromJson(response.data),
        onError: (error) => ErrorDto.fromJson(error.response?.data));
    print(result);
    return result
      ..onData((data) => print('success ${data.statusCode}'))
      ..onError((error) => print('error ${error.message}'));
  }

  Future<Result<AuthenticationResponse, ErrorDto>> activationEmail(
      String tempKey) async {
    print(tempKey);

    final result = await request<AuthenticationResponse, ErrorDto>(
        makeRequest: (dio) =>
            dio.get('/auth/confirmationEmail/active/${tempKey.toString()}'),
        onSuccess: (response) => AuthenticationResponse.fromJson(response.data),
        onError: (error) => ErrorDto.fromJson(error.response?.data));
    print('${result.data?.tokens.refreshToken} print tokkens');
    return result
      ..onData((data) => print('success ${data.tokens.accessToken}'))
      ..onError((error) => print('error ${error.message}'));
  }

  Future<Result<Tokens, ErrorDto>> refresh() async {
    final result = await request<Tokens, ErrorDto>(
        makeRequest: (dio) => dio.get('/auth/refresh'),
        onSuccess: (response) => Tokens.fromJson(response.data),
        onError: (error) => ErrorDto.fromJson(error.response?.data));
    return result
      ..onData((data) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', data.accessToken);
        prefs.setString('refreshToken', data.refreshToken);
      });
  }
}
