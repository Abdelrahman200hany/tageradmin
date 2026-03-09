import 'package:flutter/material.dart';
import 'package:tageradmin/feature/auth/presentation/views/add_product_view.dart';
import 'package:tageradmin/feature/home/presentation/views/home_view.dart';
import 'package:tageradmin/feature/splash/presentation/views/splash_view.dart';
import 'package:tageradmin/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
          case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
        case AddProductview.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductview());
        case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
