import 'package:flutter/material.dart';
import 'package:news_app/screens/demo_home_screen.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DemoHomeScreen(),
      home: HomeScreen(),
    );
  }
}



