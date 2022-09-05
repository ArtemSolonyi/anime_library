// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
