import 'package:flutter/cupertino.dart';
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
      return [false, "O nome não pode estar em branco."];
    }

    RegExp validName = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

    if (validName.hasMatch(name)) {
      return [true];
    } else {
      return [false, "Insira um nome válido."];
    }
  }

  List validateBirth(String birth) {
    if (birth.isEmpty) {
      // return 'birth_required'.i18n();
      return [false, "A data de nascimento não pode estar em branco."];
    }
    return [true];
  }

  List validateEmail(String email) {
    if (email.isEmpty) {
      // return 'birth_required'.i18n();
      return [false, "O email não pode estar em branco."];
    }

    RegExp validEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(validEmail.hasMatch(email)){

    }
    return [true];
  }

  List validateUsername(String username) {
    if (username.isEmpty) {
      // return 'username_required'.i18n();
      return [false, "O nome de usuário não pode estar em branco."];
    }

    return [true];
  }

  List validatePassword(String password) {
    if (password.isEmpty) {
      // return 'password_required'.i18n();
      return [false, "A senha não pode estar em branco."];
    }

    return [true];
  }

  List validateConfirmPassword(String password, String confirm_password) {
    if (confirm_password.isEmpty) {
      return [false, "A confirmação da senha não pode estar em branco."];
    }

    if (password != confirm_password) {
      return [false, "A senha e a confirmação de senha não são as mesmas."];
    }

    return [true];
  }

  List validateAllFields(String username, String name, String birth,
      String email, String password, String confirmPassword) {
    if (!validateUsername(username)[0]) {
      return validateUsername(username);
    }

    if (!validateName(name)[0]) {
      return validateName(name);
    }

    if (!validateEmail(email)[0]) {
      return validateEmail(email);
    }

    if (!validateBirth(birth)[0]) {
      return validateBirth(birth);
    }

    if (!validatePassword(password)[0]) {
      return validatePassword(password);
    }

    if (!validateConfirmPassword(password, confirmPassword)[0]) {
      return validateConfirmPassword(password, confirmPassword);
    }

    return [true];
  }

  Future<User> signup(String username, String name, String birth, String email,
      String password, String confirmPassword) {
    var respValidateAllFields = validateAllFields(
        username, name, birth, email, password, confirmPassword);
    if (!respValidateAllFields[0]) {
      final msg = respValidateAllFields[1];
      return Future.error(msg);
    } else {
      return repository
          .signup(User(username, name, birth, password, confirmPassword));
    }
  }
}