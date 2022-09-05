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
