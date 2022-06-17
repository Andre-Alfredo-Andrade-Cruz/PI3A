import 'package:pdm/src/Features/auth/domain/model/signup.dart';

class UserDto {
  const UserDto(this.username, this.birth, this.email, this.password,
      this.confirmPassword, this.token);

  final String username;
  final String birth;
  final String email;
  final String password;
  final String confirmPassword;
  final String token;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.username, user.birth, user.email, user.password,
        user.confirmPassword, token!);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['username'], json['password'], json['token']);

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'token': token};
}
