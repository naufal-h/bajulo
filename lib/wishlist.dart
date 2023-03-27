import 'package:bajulo/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajulo/layout%20gridview/layoutgridAll.dart';
import 'package:bajulo/navbar.dart';
import 'package:bajulo/product_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bajulo/category.dart';
import 'package:bajulo/product_card.dart';

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Wishlist", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(child: gridLayout()),
          ),
        ],
      ),
    );
  }
}
