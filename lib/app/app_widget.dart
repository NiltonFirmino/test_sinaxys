import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/constants/app_strings.dart';
import 'core/utils/style/themes/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
