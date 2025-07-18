import 'package:flutter/material.dart';
import 'route_generator.dart';

class AppRouter {
  final RouteGenerator routeGenerator;

  AppRouter(this.routeGenerator);

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final widget = routeGenerator.generateRoute(settings);
    if (widget != null) {
      return MaterialPageRoute(builder: (_) => widget);
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}