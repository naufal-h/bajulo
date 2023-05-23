import 'package:bajulo_new/screens/product/products_overview_screen.dart';
import 'package:bajulo_new/screens/notif_screen.dart';
import 'package:bajulo_new/screens/search_screen.dart';
import 'package:bajulo_new/screens/user_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProductsOverviewScreen(),
    SearchScreen(),
    NotifScreen(),
    UserScreen()
  ];
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.notifications),
    Icon(Icons.person)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        unselectedItemColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Colors.white,
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
