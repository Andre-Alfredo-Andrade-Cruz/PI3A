// import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/login_screen_interface.dart';
import '../dto/user_dto.dart';

class LoginScreenRepository implements ILogin {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'http://flutter-api.mocklab.io/auth/login',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(
          user.username, user.birth, user.password, user.confirmPassword,
          token: token);
      return Future.value(domain);
    } else {
      throw Exception("Usuário ou Senha Inválidos!");
    }
  }
}
