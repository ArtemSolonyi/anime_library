import 'package:json_annotation/json_annotation.dart';
part 'tokens.dto.g.dart';

@JsonSerializable()
class Tokens {
  String accessToken;
  String refreshToken;
  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, Object?> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}
