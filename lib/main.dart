import 'package:flutter/material.dart';
import 'package:url_shortner/screens/home.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: HomePage(),
    );
  }
}