import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_app/bloc/test_bloc.dart';
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
          builder: (_) => BlocProvider.value(
            value: GetIt.I<TestBloc>(),
            child: SecondPage(),
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
