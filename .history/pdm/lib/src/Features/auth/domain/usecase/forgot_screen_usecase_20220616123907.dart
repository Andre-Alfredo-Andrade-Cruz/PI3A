import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/auth/data/repository/forgot_screen_repository.dart';

import '../model/forgot.dart';
import '../repository/forgot_screen_interface.dart';

class ForgotUseCase {
  final repository = ForgotScreenRepository();

  List validateEmail(String birth) {
    if (birth.isEmpty) {
      return [false, "A data de nascimento não pode estar em branco."];
    }
    return [true];
  }

  Future<User> forgot(String email) {
    return repository.forgot(User(email));
  }
}
