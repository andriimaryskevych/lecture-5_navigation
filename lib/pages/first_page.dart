import 'package:flutter/material.dart';
import 'package:navigation_app/pages/second_page.dart';
import 'package:navigation_app/pages/third_page.dart';
import 'package:navigation_app/routes.dart';

const String tag = '---------------------------------->\n';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'First page',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(ScaleRotateRoute(page: SecondPage()));
              },
              child: Text('Scale 3'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(FadeRoute(page: SecondPage()));
              },
              child: Text('Fade'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic res = await Navigator.of(context).pushNamed(secondPage);

          print('${tag}Second page has popped');
          print(res.toString());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRotateRoute({
    required this.page,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({
    required this.page,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
