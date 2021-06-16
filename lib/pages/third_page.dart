import 'package:flutter/material.dart';
import 'package:navigation_app/observer.dart';
import 'package:navigation_app/routes.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with RouteAware {
  String page = 'page3';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();

    routeObserver.unsubscribe(this);
  }

  @override
  void didPush() {
    super.didPush();

    print('$page didPush');
  }

  @override
  void didPushNext() {
    super.didPushNext();

    print('$page didPushNext');
  }

  @override
  void didPopNext() {
    super.didPopNext();

    print('$page didPopNext');
  }

  @override
  void didPop() {
    super.didPop();

    print('$page didPop');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Third page',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName(homePage));
              },
              child: Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
