import 'package:pdm/src/Features/auth/domain/model/forgot.dart';

class UserDto {
  const UserDto(this.email);

  final String email;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.email);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['email']);

  Map<String, dynamic> toJson() => {'email': email};
}
