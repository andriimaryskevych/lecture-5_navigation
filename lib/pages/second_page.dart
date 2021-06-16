import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
