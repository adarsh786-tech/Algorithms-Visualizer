import 'package:flutter/material.dart';
import 'package:sorting_visualizer/mainPage.dart';

void main() => runApp(
  RootRestorationScope(
    restorationId: 'root',
    child: MaterialApp(home: MainPage()),

  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),

    );
  }
}
