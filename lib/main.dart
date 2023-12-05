import 'package:flutter/material.dart';
import 'package:greenglimpse/src/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'greenglimpse',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeView(),
    );
  }
}

