import 'package:basearch/src/features/auth/domain/model/user.dart';

class UserDto {
  const UserDto(this.name, this.username);

  final String name;
  final String username;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.name, user.username);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['name'],json['username']);

  Map<String, dynamic> toJson() => {'name': name,'username': username};
}
