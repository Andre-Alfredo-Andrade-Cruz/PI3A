import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/auth/data/repository/login_screen_repository.dart';

import '../model/user.dart';
import '../repository/login_screen_interface.dart';

class LoginUseCase {
  // final repository = Modular.get<ILogin>();
  final repository = LoginScreenRepository();

  List validateUsername(String username) {
    if (username.isEmpty) {
      return [false, 'O campo usuario não pode estar em branco.'];
    }

    return [true];
  }

  List validatePassword(String password) {
    if (password.isEmpty) {
      return [false, 'A senha não pode estar em branco.'];
    }
    return [true];
  }

  Future<User> login(String username, String password) {
    if (!validateUsername(username)[0]) {
      final errorMsg = validateUsername(username)[1];
      return Future.error("$errorMsg");
    }

    if (!validatePassword(password)[0]) {
      final errorMsg = validatePassword(password)[1];
      return Future.error("$errorMsg");
    }

    return repository.login(User(username, password));
  }
}
