import 'package:flutter/material.dart';
import 'package:navigation_app/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onUnknownRoute: RouteGenerator.onUnknownRoute,
    );
  }
}
