import 'package:flutter/material.dart';
import 'src/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVC Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginView(),
    );
  }
}