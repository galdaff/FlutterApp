import 'package:first_project/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " Flutter Shoes Store",
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
