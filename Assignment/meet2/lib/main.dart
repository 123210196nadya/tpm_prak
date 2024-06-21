import 'package:flutter/material.dart';
import 'package:meet2/meet2.dart';
import 'package:meet2/meet3.dart';
import 'package:meet2/meet3v2.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}