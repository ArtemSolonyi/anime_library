import 'package:json_annotation/json_annotation.dart';
part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  int statusCode;
  String message;
  String error;

  ErrorDto({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory ErrorDto.fromJson(Map<String, Object?> json) =>
      _$ErrorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
