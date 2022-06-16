import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/forgot.dart';
import '../repository/forgot_screen_interface.dart';

class ForgotUseCase {
  final repository = Modular.get<IForgot>();

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_required'.i18n();
    }
    return null;
  }

  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'username_required'.i18n();
    }

    return null;
  }

  Future<User> forgot(String username, String name) {
    return repository.forgot(User(username, name));
  }
}
