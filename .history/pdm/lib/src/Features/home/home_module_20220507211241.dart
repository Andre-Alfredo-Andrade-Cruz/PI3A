import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/view/page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage(), children: []),
      ];
}
