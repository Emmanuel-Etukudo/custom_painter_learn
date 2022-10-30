import 'package:flutter/material.dart';
import '../homepage/homepage.dart';

class Routes {
  static const String homepage = "/";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homepage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No route found'),
              ),
              body: const Center(
                child: Text('No route found'),
              ),
            ));
  }
}
