import 'package:bajulo/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajulo/layout%20gridview/layoutgridAll.dart';
import 'package:bajulo/navbar.dart';
import 'package:bajulo/product_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bajulo/category.dart';
import 'package:bajulo/product_card.dart';

class wishlistUser extends StatefulWidget {
  const wishlistUser({super.key});

  @override
  State<wishlistUser> createState() => _wishlistUserState();
}

class _wishlistUserState extends State<wishlistUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Wishlist", style: TextStyle(fontFamily: "Poppins")),
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
          Container(child: gridLayout()),
        ],
      ),
    );
  }
}
