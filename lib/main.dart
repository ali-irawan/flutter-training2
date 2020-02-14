import 'package:flutter/material.dart';
import 'named-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Routing",
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        InfoScreen.routeName: (context) => InfoScreen(),
      },
    );
  }
}