import 'package:flutter/material.dart';

abstract class RouteGenerator {
  String get baseRoute;
  Widget? generateRoute(RouteSettings settings);
}