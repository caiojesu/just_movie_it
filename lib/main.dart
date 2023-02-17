import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:just_movie_it/core/configs/injection/injection.dart';

import 'app.dart';

void main() {
  usePathUrlStrategy();
  configureDependencies();
  runApp(const App());
}
