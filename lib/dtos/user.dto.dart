import 'package:json_annotation/json_annotation.dart';
part 'user.dto.g.dart';

@JsonSerializable()
class User {
  String username;
  String role;
  String email;

  User({
    required this.username,
    required this.role,
    required this.email,
  });

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserProfile {
  String nickname;
  String username;
  String avatar;

  UserProfile({
    required this.username,
    required this.nickname,
    required this.avatar,
  });
  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
