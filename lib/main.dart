import 'package:flutter/material.dart';
import 'package:modern_smart_home/screens/HomeScreen.dart';
import 'package:modern_smart_home/screens/reponsive_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Responsive.isMobile(context) ? const HomeScreen() : null,
    );
  }
}
