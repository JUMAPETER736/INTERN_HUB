import 'package:flutter/material.dart';
import 'package:internhub/LogIn_ And_Register/Log_In.dart';
import 'package:internhub/LogIn_ And_Register/Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/LogIn', // Set initial route
      routes: {
        '/LogIn': (context) => Log_In(), // Define LogIn route
        '/Register': (context) => Register(), // Define Register route
      },
      // or use onGenerateRoute if you want more dynamic route handling
    );
  }
}