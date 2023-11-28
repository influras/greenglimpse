import 'package:flutter/material.dart';
import 'src/views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVC Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginView(),
    );
  }
}