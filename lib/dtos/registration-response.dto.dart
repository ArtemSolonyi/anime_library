import 'package:json_annotation/json_annotation.dart';

part 'registration-response.dto.g.dart';

@JsonSerializable()
class RegistrationResponse {
  int statusCode;
  String message;

  RegistrationResponse({
    required this.statusCode,
    required this.message,
  });

  factory RegistrationResponse.fromJson(Map<String, Object?> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}
