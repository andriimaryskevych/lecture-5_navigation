import 'package:flutter/material.dart';

class SecondPageArguments {
  final String message;
  final int? pageNumber;

  SecondPageArguments({
    required this.message,
    this.pageNumber,
  });
}

class SecondPage extends StatefulWidget {
  final SecondPageArguments arguments;

  SecondPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    print(widget.arguments.message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page ${widget.arguments.message}'),
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
