import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/signup.dart';
import '../repository/signup_screen_interface.dart';

class SignupUseCase {
  final repository = Modular.get<ISignup>();

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_required'.i18n();
    }
    return null;
  }

  String? validateBirth(String birth) {
    if (birth.isEmpty) {
      return 'birth_required'.i18n();
    }
    return null;
  }

  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'username_required'.i18n();
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'password_required'.i18n();
    }

    return null;
  }

  String? validateConfirmPassword(String confirm_password) {
    if (confirm_password.isEmpty) {
      return 'confirm_password_required'.i18n();
    }

    return null;
  }

  Future<User> signup(String username, String name, String birth, String password, String confirm_password) {
    return repository.signup(User(username, name, birth, password, confirm_password));
  }
}
