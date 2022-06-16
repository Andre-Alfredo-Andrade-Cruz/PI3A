import 'package:dio/dio.dart';
import '../../domain/model/signup.dart';
import '../../domain/repository/signup_screen_interface.dart';
import '../dto/signup_dto.dart';

class SignupScreenRepository implements ISignup {
  @override
  Future<User> signup(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'http://10.0.2.2:3000/signup',
      queryParameters: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(user.username, user.birth, user.email, user.password,
          user.confirmPassword,
          token: token);
      return Future.value(domain);
    } else {
      print(response.headers.);
      throw Exception("Não foi possível cadastrar usuário!");
    }
  }
}
