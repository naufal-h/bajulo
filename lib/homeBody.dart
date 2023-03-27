import 'package:bajulo/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajulo/layout%20gridview/layoutgridAll.dart';
import 'package:bajulo/navbar.dart';
import 'package:bajulo/product_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bajulo/category.dart';
import 'package:bajulo/product_card.dart';

class home_body extends StatefulWidget {
  const home_body({super.key});

  @override
  State<home_body> createState() => _home_bodyState();
}

class _home_bodyState extends State<home_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("", style: TextStyle(fontFamily: "Poppins")),
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
            margin: EdgeInsets.only(left: 10, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Trending",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 152.0),
            items: [6, 7, 8].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage("assets/images/asset $i.jpg"),
                            fit: BoxFit.fitWidth)),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          category(),
          //product card
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(child: gridLayout()),
          ),
        ],
      ),
    );
  }
}
