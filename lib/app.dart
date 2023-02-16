import 'package:flutter/material.dart';
import 'package:just_movie_it/core/configs/theme/app_theme.dart';

import 'core/configs/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      restorationScopeId: 'app',
      theme: makeAppTheme(),
    );
  }
}
