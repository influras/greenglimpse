import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/reel_model.dart';
import 'src/controllers/reel_controller.dart';
import 'src/views/reels_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Reels> reels = ReelController().getReels();
    print(reels);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVC Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ReelsView(),
    );
  }
}
