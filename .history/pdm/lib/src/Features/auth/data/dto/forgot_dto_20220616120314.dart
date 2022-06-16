import 'package:pdm/src/Features/auth/domain/model/forgot.dart';

class UserDto {
  const UserDto(this.email);

  final String email;
  final String name;
  final String username;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.email);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['email'], json['username']);

  Map<String, dynamic> toJson() => {'name': name, 'username': username};
}
