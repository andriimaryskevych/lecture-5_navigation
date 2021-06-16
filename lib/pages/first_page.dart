import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_app/routes.dart';
import 'package:navigation_app/services/navigation.dart';

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GetIt.I<NavigationService>().pushNamed(secondPage);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
