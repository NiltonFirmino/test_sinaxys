import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/constants/app_routes.dart';
import 'modules/main_module/main_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(kRouteMain, module: MainModule()),
  ];
}
