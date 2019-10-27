import 'package:apphackathon/Screens/alunos_screen.dart';
import 'package:apphackathon/Screens/home_prof_screen.dart';
import 'package:apphackathon/Screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff19648A)
      ),
      home: LoginScreen(),
    );
  }
}