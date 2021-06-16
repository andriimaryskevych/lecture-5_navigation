import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_app/bloc/test_bloc.dart';
import 'package:navigation_app/route_generator.dart';
import 'package:navigation_app/services/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton<NavigationService>(() => NavigationService());
  GetIt.I.registerFactory<TestBloc>(() => TestBloc(navigationService: GetIt.I<NavigationService>()));

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
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
    );
  }
}
