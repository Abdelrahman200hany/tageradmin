import 'package:flutter/material.dart';
import 'package:tageradmin/feature/auth/presentation/views/sign_view.dart';
import 'package:tageradmin/feature/home/presentation/views/home_view.dart';
import 'package:tageradmin/feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
          case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
        case SignView.routeName:
      return MaterialPageRoute(builder: (context) => const SignView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
