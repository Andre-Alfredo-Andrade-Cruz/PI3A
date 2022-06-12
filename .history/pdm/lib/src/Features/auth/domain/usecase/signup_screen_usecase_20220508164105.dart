import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/auth/data/repository/signup_screen_repository.dart';

import '../model/signup.dart';
import '../repository/signup_screen_interface.dart';

class SignupUseCase {
  // final repository = Modular.get<ISignup>();
  final repository = SignupScreenRepository();

  List validateName(String name) {
    if (name.isEmpty) {
      // return 'name_required'.i18n();
      return [false, "O nome está em branco."]
    }
    return [true];
  }

  List validateBirth(String birth) {
    if (birth.isEmpty) {
      // return 'birth_required'.i18n();
      return [false, "A data de nascimento está em branco."]
    }
    return [true];
  }

  List validateUsername(String username) {
    if (username.isEmpty) {
      // return 'username_required'.i18n();
      return [false, "O nome de usuário está em branco."];
    }

    return [true];
  }

  List validatePassword(String password) {
    if (password.isEmpty) {
      // return 'password_required'.i18n();
      return [false, "A senha está em branco."];
    }

    return [true];
  }

  List validateConfirmPassword(String password, String confirm_password) {

    if (confirm_password.isEmpty) {
      return [false, "A confirmação da senha está em branco."];
    }

    if(password != confirm_password){
      return [false, "A senha e a confirmação de senha não são as mesmas."];
    }

    return [true];
  }

  Future<User> signup(String username, String name, String birth,
      String password, String confirm_password) {
    if (validateName(username)) {}

    return repository
        .signup(User(username, name, birth, password, confirm_password));
  }
}
