// import 'package:basearch/src/features/auth/domain/model/user.dart';

import '../../domain/model/user.dart';

// import '../../domain/model/signup.dart';

class UserDto {
  const UserDto(this.username, this.password);

  final String username;
  final String password;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.username, user.password);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['username'], json['password']);

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
