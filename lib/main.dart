import 'package:flutter/material.dart';
import 'package:parkvision/splash_screen.dart';

void main() {
  runApp(Parkvision());
}

class Parkvision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splashpage(),
    );
  }
}