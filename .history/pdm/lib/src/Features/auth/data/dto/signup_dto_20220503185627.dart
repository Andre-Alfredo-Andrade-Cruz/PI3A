// import 'package:basearch/src/features/auth/domain/model/user.dart';

import '../../domain/model/user.dart';

class UserDto {
  const UserDto(this.username, this.password, this.token);

  final String username;
  final String password;
  final String token;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.username, user.password, user.token!);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['username'], json['password'], json['token']);

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'token': token};
}
