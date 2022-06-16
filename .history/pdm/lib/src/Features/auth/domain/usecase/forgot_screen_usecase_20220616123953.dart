import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/auth/data/repository/forgot_screen_repository.dart';

import '../model/forgot.dart';
import '../repository/forgot_screen_interface.dart';

class ForgotUseCase {
  final repository = ForgotScreenRepository();

  List validateEmail(String email) {
    if (email.isEmpty) {
      return [false, "O email não pode estar em branco."];
    }

    RegExp validEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (validEmail.hasMatch(email)) {
      return [true];
    } else {
      return [false, "Insira um email válido."];
    }
  }

  Future<User> forgot(String email) {
     if (!respValidateAllFields[0]) {
      final msg = respValidateAllFields[1];
      return Future.error(msg);
    } else {
      return repository.forgot(User(email));
    }
  }
}
