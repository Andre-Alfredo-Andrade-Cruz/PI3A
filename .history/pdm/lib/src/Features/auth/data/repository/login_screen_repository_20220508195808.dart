// import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/user.dart';
// import '../../domain/model/signup.dart';
import '../../domain/repository/login_screen_interface.dart';
import '../dto/user_dto.dart';

class LoginScreenRepository implements ILogin {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);
    print(dto);
    // final response = await Dio().post(
    //   'http://10.0.2.2:3000/login',
    //   data: dto.toJson(),
    // );
    final response = await Dio().post('http://10.0.2.2:3000/login',
        data: dto.toJson(),
        queryParameters: {
          'username': dto.toJson()['username'],
          'password': dto.toJson()['password']
        });
    print(response);
    print(response.headers.value('Authorization'));
    if (response.statusCode == 200) {
      // final token = response.headers.value('Authorization');
      final domain = User(user.username, user.password);
      return Future.value(domain);
    } else {
      print('oiiii');
      return Future.error(response.data);
      // throw Exception("Usuário ou Senha Inválidos!");
    }
  }
}
