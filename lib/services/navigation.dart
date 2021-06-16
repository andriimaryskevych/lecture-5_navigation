import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return _navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop<T extends Object>([T? result]) {
    return _navigatorKey.currentState!.pop(result);
  }
}
