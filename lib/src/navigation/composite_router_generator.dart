import 'package:flutter/material.dart';
import 'route_generator.dart';

class CompositeRouteGenerator implements RouteGenerator {
  final List<RouteGenerator> _generators;

  CompositeRouteGenerator(this._generators);

  @override
  String get baseRoute => '/';

  @override
  Widget? generateRoute(RouteSettings settings) {
    for (final generator in _generators) {
      final widget = generator.generateRoute(settings);
      if (widget != null) {
        return widget;
      }
    }
    return null;
  }
}
