import 'package:flutter/material.dart';
import 'package:navigation_app/pages/second_page.dart';
import 'package:navigation_app/routes.dart';

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
        onPressed: () async {
          dynamic returnValue = await Navigator.of(context).pushNamed(
            secondPage,
            arguments: SecondPageArguments(
              message: 'Arguments data push named',
            ),
          );

          if (returnValue != null) {
            try {
              returnValue = returnValue as String;

              print('Return value $returnValue');
            } catch (err) {}
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
