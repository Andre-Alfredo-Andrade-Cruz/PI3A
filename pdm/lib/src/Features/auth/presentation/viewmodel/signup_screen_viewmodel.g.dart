// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_viewmodel.dart';

mixin _$SignupScreenViewModel on _SignupScreenViewModelBase, Store {
  final _$nameAtom = Atom(name: '_SignupScreenViewModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$birthAtom = Atom(name: '_SignupScreenViewModelBase.birth');

  @override
  String get birth {
    _$birthAtom.reportRead();
    return super.birth;
  }

  @override
  set birth(String value) {
    _$birthAtom.reportWrite(value, super.birth, () {
      super.birth = value;
    });
  }
  
  final _$usernameAtom = Atom(name: '_SignupScreenViewModelBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignupScreenViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_SignupScreenViewModelBase.confirm_password');

  @override
  String get confirm_password {
    _$confirmPasswordAtom.reportRead();
    return super.confirm_password;
  }

  @override
  set confirm_password(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirm_password, () {
      super.confirm_password = value;
    });
  }


  final _$isLoadingAtom = Atom(name: '_SignupScreenViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_SignupScreenViewModelBaseActionController =
      ActionController(name: '_SignupScreenViewModelBase');

  @override
  void validateUsername() {
    final _$actionInfo = _$_SignupScreenViewModelBaseActionController.startAction(
        name: '_SignupScreenViewModelBase.validateUsername');
    try {
      return super.validateUsername();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_SignupScreenViewModelBaseActionController.startAction(
        name: '_SignupScreenViewModelBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
birth: ${birth},
username: ${username},
password: ${password},
confirm_password: ${confirm_password},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$LoginError on _LoginErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginErrorBase.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_SignupScreenViewModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$birthAtom = Atom(name: '_SignupScreenViewModelBase.birth');

  @override
  String get birth {
    _$birthAtom.reportRead();
    return super.birth;
  }

  @override
  set birth(String value) {
    _$birthAtom.reportWrite(value, super.birth, () {
      super.birth = value;
    });
  }

  final _$usernameAtom = Atom(name: '_LoginErrorBase.username');

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginErrorBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_SignupScreenViewModelBase.confirm_password');

  @override
  String get confirm_password {
    _$confirmPasswordAtom.reportRead();
    return super.confirm_password;
  }

  @override
  set confirm_password(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirm_password, () {
      super.confirm_password = value;
    });
  }

  final _$loginAtom = Atom(name: '_LoginErrorBase.login');

  @override
  String? get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String? value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
birth: ${birth},
username: ${username},
password: ${password},
confirm_password: ${confirm_password},
login: ${login},
hasErrors: ${hasErrors}
    ''';
  }
}
