import 'package:pdm/src/Features/auth/domain/model/signup.dart';

class UserDto {
  const UserDto(this.username, this.email, this.birth, this.password,
      this.confirmPassword, this.token);

  final String username;
  final String email;
  final String birth;
  final String email;
  final String password;
  final String confirmPassword;
  final String? token;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.username, user.email, user.birth, user.password,
        user.confirmPassword, user.token);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
      json['username'],
      json['birth'],
      json['email'],
      json['password'],
      json['confirmPassword'],
      json['token']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'token': token
      };
}
