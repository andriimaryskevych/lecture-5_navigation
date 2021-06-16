import 'package:flutter/material.dart';
import 'package:navigation_app/pages/first_page.dart';
import 'package:navigation_app/pages/second_page.dart';
import 'package:navigation_app/routes.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'Home page'),
        );

      case secondPage:
        return MaterialPageRoute(
          builder: (_) => SecondPage(
            message: 'Hello',
          ),
        );

      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page not found'),
        ),
      );
    });
  }
}
