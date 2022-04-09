import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/signup_screen_usecase.dart';

part 'signup_screen_viewmodel.g.dart';

class SignupScreenViewModular = _SignupScreenViewModelBase with _$SignupScreenViewModel;

abstract class _SignupScreenViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<SignupScreenUseCase>();
  
  @observable
  String name = '';

  @observable
  String birth = '';

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String confirm_password = '';

  @observable
  bool isLoading = false;

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateBirth() {
    error.birth = _usecase.validateBirth(birth);
  }
  
  @action
  void validateUsername() {
    error.username = _usecase.validateUsername(username);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }
  
  @action
  void validateConfirmPassword() {
    error.confirm_password = _usecase.validateConfirmPassword(confirm_password);
  }

  void login() async {
    error.clear();

    validateName();
    validateBirth();
    validateUsername();
    validatePassword();
    validateConfirmPassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.login(username, password);
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
  String? name;

  @observable
  String? birth;

  @observable
  String? username;

  @observable
  String? password;

  @observable
  String? password;

  @observable
  String? confirm_password;

  @computed
  bool get hasErrors => name != null || birth != null | username != null || password != null || confirm_password != null || login != null;

  void clear() {
    name = null;
    birth = null;
    username = null;
    password = null;
    confirm_password = null;
    login = null;
  }
}
