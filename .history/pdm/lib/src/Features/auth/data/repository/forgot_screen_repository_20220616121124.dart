import 'package:dio/dio.dart';
import '../../domain/model/forgot.dart';
import '../../domain/repository/forgot_screen_interface.dart';
import '../dto/forgot_dto.dart';

class ForgotScreenRepository implements IForgot {
  @override
  Future<User> forgot(User user) async {
    final dto = UserDto.fromDomain(user);
    print(dto.toJson())
    final response = await Dio().post(
      'http://10.0.2.2:3000/forgot',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(user.email, token: token);
      return Future.value(domain);
    } else {
      throw Exception(response.headers['Message']);
    }
  }
}
