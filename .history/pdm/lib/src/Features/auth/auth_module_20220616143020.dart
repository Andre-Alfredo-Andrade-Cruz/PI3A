import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_module.dart';
import 'domain/repository/login_screen_interface.dart';
import 'domain/usecase/login_screen_usecase.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/forgot_page.dart';
import 'presentation/view/page/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind.factory((i) => LoginScreenViewModel()),
        Bind.factory((i) => LoginUseCase()),
        // Bind.factory<ILogin>((i) => LoginScreenRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => LoginScreen()),
        // ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
