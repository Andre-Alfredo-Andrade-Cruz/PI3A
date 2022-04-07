import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'data/repository/login_screen_repository.dart';
import 'domain/repository/login_screen_interface.dart';
import 'domain/usecase/login_screen_usecase.dart';
import 'presentation/view/page/login_screen.dart';
import 'presentation/view/page/forgot_screen.dart';
import 'presentation/view/page/signup_screen.dart';
import 'presentation/view/page/welcome_screen.dart';
import 'presentation/viewmodel/login_screen_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginScreenViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory<ILogin>((i) => LoginScreenRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginScreen()),
        //ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
