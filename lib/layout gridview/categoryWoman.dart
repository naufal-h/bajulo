import 'package:bajulo/cart.dart';
import 'package:bajulo/homeScreen.dart';
import 'package:bajulo/layout gridview/layoutgrid%20men%20top.dart';
import 'package:bajulo/layout%20gridview/layoutgridAll.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajulo/layout%20gridview/layoutgrid%20woman.dart';
import 'package:bajulo/login%20fix.dart';
import 'package:bajulo/navbar.dart';
import 'package:bajulo/widget028Bottom.dart';
import 'package:bajulo/notif.dart';
import 'package:bajulo/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class categoryWoman extends StatefulWidget {
  const categoryWoman({super.key});

  @override
  State<categoryWoman> createState() => _categoryWomanState();
}

class _categoryWomanState extends State<categoryWoman> {
  @override
  Widget build(BuildContext context) {
    //   int _currentIndex = 0;
    // final List<Widget> _pages = [homeScreen(), search(), notif(), loginfix()];
    // List<Widget> body = const [
    //   Icon(Icons.home),
    //   Icon(Icons.search),
    //   Icon(Icons.notifications),
    //   Icon(Icons.person)
    // ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Woman", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon:
                SvgPicture.asset('assets/icons/cart.svg', color: Colors.white),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const cart()))
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: gridLayoutWoman(),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Theme.of(context).colorScheme.tertiary,
      //   unselectedItemColor: Theme.of(context).colorScheme.background,
      //   selectedItemColor: Colors.white,
      //   iconSize: 30,
      //   currentIndex: _currentIndex,
      //   onTap: (int newIndex) {
      //     setState(() {
      //       _currentIndex = newIndex;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
      //     BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
      //     BottomNavigationBarItem(label: "", icon: Icon(Icons.notifications)),
      //     BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
      //   ],
      // ),
    );
  }
}
