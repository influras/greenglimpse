import 'package:flutter/material.dart';
import 'package:greenglimpse/src/views/login_view.dart';
import 'package:greenglimpse/src/views/market_view.dart';
import 'package:greenglimpse/src/views/reels_view.dart';
import 'package:greenglimpse/src/views/shoppingcart_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const ReelsTab(),
    const MarketTab(),
    const MeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Align( alignment: Alignment.centerLeft, child: Image.asset('assets/images/glimpse_logo_blatt_weiß.png')),

        title: const Center(child: Text('greenglimpse', style: TextStyle(fontFamily: 'Mouldy'))) ,
        actions: [
           
          // Add a shopping cart icon
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the shopping cart view
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCartView()),
              );
            },
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: _shouldShowBottomNavBar()
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle),
                  label: 'Reels',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.discount),
                  label: 'Market',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Me',
                ),
              ],
            )
          : null, // Set to null to hide the bottom navigation bar
    );
  }

  // Function to determine whether to show the bottom navigation bar
  bool _shouldShowBottomNavBar() {
    // You can customize this logic based on your requirements
    return ModalRoute.of(context)?.settings.name !=
        '/login'; // Example: Don't show on the login screen
  }
}

class ReelsTab extends StatelessWidget {
  const ReelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ReelsView(),
    );
  }
}

class MarketTab extends StatelessWidget {
  const MarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MarketView(),
    );
  }
}

class MeTab extends StatelessWidget {
  const MeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoginView(),
    );
  }
}