import 'package:basearch/src/features/auth/domain/model/user.dart';

class UserDto {
  const UserDto(this.name, this.birth, this.username, this.password, this.confirm_password);

  final String name;
  final String birth;
  final String username;
  final String password;
  final String confirm_password;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.name, user.birth, user.username, user.password, user.confirm_password);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['name'], json['birth'], json['username'], json['password'], json['confirm_password']);

  Map<String, dynamic> toJson() => {'name': name, 'birth': birth, 'username': username, 'password': password, 'confirm_password': confirm_password};
}
