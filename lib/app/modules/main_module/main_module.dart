import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sinaxys/app/modules/main_module/main_page.dart';

import 'submodules/home_module/home_bloc.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const MainPage(),
      children: [],
    ),
  ];
}
