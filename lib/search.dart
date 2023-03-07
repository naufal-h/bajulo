import 'package:bajulo/appBar.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFF1F1F1F),
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: SizedBox(
              height: 37,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none,
                      suffix: Icon(Icons.search),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
