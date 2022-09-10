import '../dtos/authentication-response.dto.dart';
import '../dtos/error_dto.dart';
import '../utils/network.dart';

class SettingsRepository {
  Future<Result<SuccessDto, ErrorDto>> requestOnChangePassword(
      String email) async {
    final result = await request<SuccessDto, ErrorDto>(
      makeRequest: (dio) => dio.patch(
        '/settings/request/forgot/password',
        data: {"email": email},
      ),
      onSuccess: (response) => SuccessDto.fromJson(response.data),
      onError: (error) => ErrorDto.fromJson(error.response?.data),
    );
    return result;
  }

  Future<Result<AuthenticationResponse, ErrorDto>> changePassword(
      String email, String newPassword) async {
    final result = await request<AuthenticationResponse, ErrorDto>(
      makeRequest: (dio) => dio.patch(
        '/settings/changing/forgot/password',
        data: {"email": email, "newPassword": newPassword},
      ),
      onSuccess: (response) => AuthenticationResponse.fromJson(response.data),
      onError: (error) => ErrorDto.fromJson(error.response?.data),
    );
    return result;
  }

  Future<Result<SuccessDto, ErrorDto>> sendingPinCodeForChange(
      String email, int pinCode) async {
    final result = await request<SuccessDto, ErrorDto>(
      makeRequest: (dio) => dio.patch(
        '/settings/sending/forgot/password',
        data: {"email": email, "passwordConfirmationCode": pinCode},
      ),
      onSuccess: (response) => SuccessDto.fromJson(response.data),
      onError: (error) => ErrorDto.fromJson(error.response?.data),
    );
    return result;
  }
}
