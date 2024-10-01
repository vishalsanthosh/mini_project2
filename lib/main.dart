import 'package:flutter/material.dart';
//import 'package:mini_project2/descriptionscreen.dart';
import 'package:mini_project2/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      theme: ThemeData(
      ),
      home:Mainscreen(),

    );
  }
}