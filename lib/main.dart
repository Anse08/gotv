import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const GoTvApp());
}

class GoTvApp extends StatelessWidget {
  const GoTvApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go tv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        primaryColor: const Color(0xFF1F6FEB),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1F6FEB),
          surface: Color(0xFF161B22),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
