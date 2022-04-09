// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_screen_viewmodel.dart';

mixin _$ForgotScreenViewModular on _ForgotScreenViewModularBase, Store {
  final _$usernameAtom = Atom(name: '_ForgotScreenViewModularBase.username');

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

  final _$nameAtom = Atom(name: '_ForgotScreenViewModularBase.name');

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

  final _$isLoadingAtom = Atom(name: '_ForgotScreenViewModularBase.isLoading');

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

  final _$_ForgotScreenViewModularBaseActionController =
      ActionController(name: '_ForgotScreenViewModularBase');

  @override
  void validateUsername() {
    final _$actionInfo = _$_ForgotScreenViewModularBaseActionController.startAction(
        name: '_ForgotScreenViewModularBase.validateUsername');
    try {
      return super.validateUsername();
    } finally {
      _$_ForgotScreenViewModularBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName() {
    final _$actionInfo = _$_ForgotScreenViewModularBaseActionController.startAction(
        name: '_ForgotScreenViewModularBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_ForgotScreenViewModularBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
name: ${name},
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

  final _$nameAtom = Atom(name: '_LoginErrorBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
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
username: ${username},
name: ${name},
login: ${login},
hasErrors: ${hasErrors}
    ''';
  }
}
