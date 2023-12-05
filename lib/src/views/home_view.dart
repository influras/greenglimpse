import 'package:flutter/material.dart';
import 'package:greenglimpse/src/views/login_view.dart';
import 'package:greenglimpse/src/views/reels_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    ReelsTab(),
    MarketTab(),
    MeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('greenglimpse', style: TextStyle(fontFamily: 'Mouldy')),
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
                  icon: Icon(Icons.shopping_cart),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ReelsView(),
    );
  }
}

class MarketTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Market Tab Content'),
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
