import 'package:go_router/go_router.dart';

import '../../../features/movies/presentation/presentation.dart';
import 'not_found_page.dart';

enum AppRoute {
  home,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      builder: (context, state) => const MovieListPage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
