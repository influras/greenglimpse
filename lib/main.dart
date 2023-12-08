import 'package:flutter/material.dart';
import 'package:greenglimpse/src/controllers/market_controller.dart';
import 'package:greenglimpse/src/controllers/shoppingcart_controller.dart';
import 'package:greenglimpse/src/views/home_view.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MarketController()),
          ChangeNotifierProvider(create: (context) => ShoppingCartController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'greenglimpse',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const HomeView(),
        ));
  }
}
