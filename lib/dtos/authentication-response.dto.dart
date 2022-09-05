import 'package:anime_library/dtos/tokens.dto.dart';
import 'package:anime_library/dtos/user.dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authentication-response.dto.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  Tokens tokens;
  User user;
  AuthenticationResponse({
    required this.tokens,
    required this.user,
  });

  factory AuthenticationResponse.fromJson(Map<String, Object?> json) =>
      _$AuthenticationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
