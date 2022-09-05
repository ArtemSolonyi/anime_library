// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication-response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'user': instance.user,
    };
