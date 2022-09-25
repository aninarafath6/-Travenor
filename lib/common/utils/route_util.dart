import 'package:flutter/material.dart';
import 'package:travenor/views/splash_view/splash_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
