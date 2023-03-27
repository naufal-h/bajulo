import 'package:bajulo/homeScreen.dart';
import 'package:bajulo/login%20fix.dart';
import 'package:bajulo/search.dart';
import 'package:bajulo/notif.dart';
import 'package:bajulo/user.dart';
import 'package:bajulo/wishlist.dart';
import 'package:flutter/material.dart';

class Widget028 extends StatefulWidget {
  const Widget028({Key? key}) : super(key: key);
  @override
  _Widget028State createState() => _Widget028State();
}

class _Widget028State extends State<Widget028> {
  int _currentIndex = 0;
  final List<Widget> _pages = [homeScreen(), search(), wishlist(), userPage()];
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
          BottomNavigationBarItem(label: "", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
