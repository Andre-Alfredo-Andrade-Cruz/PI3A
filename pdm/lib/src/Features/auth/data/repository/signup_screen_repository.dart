import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/signup.dart';
import '../../domain/repository/signup_screen_interface.dart';

class SignupScreenRepository implements ISignup {
  @override
  Future<User> signup(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'http://flutter-api.mocklab.io/auth/login',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(user.name,user.birth, user.username, user.password, user.confirm_password, token: token);
      return Future.value(domain);
    } else {
      throw Exception("Não foi possível cadastrar usuário!");
    }
  }
}
