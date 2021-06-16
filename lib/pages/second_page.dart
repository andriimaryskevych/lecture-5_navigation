import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String message;

  SecondPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    print(arguments.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Second page $message'),
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
