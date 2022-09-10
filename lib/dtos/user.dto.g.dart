// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      role: json['role'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'role': instance.role,
      'email': instance.email,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      username: json['username'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'username': instance.username,
      'avatar': instance.avatar,
    };
