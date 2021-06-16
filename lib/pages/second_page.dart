import 'package:flutter/material.dart';
import 'package:navigation_app/routes.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Second page',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) {
                  return ModalRoute.withName(homePage)(route) || ModalRoute.withName(secondPage)(route);
                });
              },
              child: Text('Home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(thirdPage, result: 'a');
              },
              child: Text('PopAndPushNamed 3'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(thirdPage, result: 'a');
              },
              child: Text('PushReplacementNamed 3'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) {
              return SecondPage();
            },
          ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
