import 'package:flutter/material.dart';
import 'package:widgets_practice_project/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Login Page",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
