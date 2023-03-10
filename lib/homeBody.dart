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
            icon: Icon(Icons.card_travel),
            onPressed: () {
              // pindah ke cart
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
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
            options: CarouselOptions(height: 200.0),
            items: [3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/asset $i.png"))),
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
            child: Container(height: 300, child: product_card()),
          ),
        ],
      ),
    );
  }
}
