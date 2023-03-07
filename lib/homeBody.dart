import 'package:bajulo/navbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bajulo/appBar.dart';
import 'package:bajulo/category.dart';

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
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 30.0,
        backgroundColor: Color(0xFF1F1F1F),
        title: Text("", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [Icon(Icons.card_travel)],
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
            items: [1, 2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/asset 1.png"))),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          category(),
        ],
      ),
    );
  }
}
