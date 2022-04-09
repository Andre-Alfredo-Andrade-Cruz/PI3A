import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/forgot_screen_usecase.dart';

part 'forgot_screen_viewmodel.g.dart';

class ForgotScreenViewModular = _ForgotScreenViewModular with _$ForgotScreenViewModel;

abstract class _ForgotScreenViewModular with Store {
  final error = LoginError();
  final _usecase = Modular.get<ForgotScreenUseCase>();

  @observable
  String username = '';

  @observable
  String name = '';

  @observable
  bool isLoading = false;

  @action
  void validateUsername() {
    error.username = _usecase.validateUsername(username);
  }

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  void login() async {
    error.clear();

    validateUsername();
    validateName();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.login(username, name);
      } on UnimplementedError {
        // TODO: Fix!!!
        error.login = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? username;

  @observable
  String? name;

  @observable
  String? login;

  @computed
  bool get hasErrors => username != null || name != null || login != null;

  void clear() {
    username = null;
    name = null;
    login = null;
  }
}
