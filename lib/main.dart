import 'package:bajulo/homeScreen.dart';
import 'package:flutter/material.dart';
import 'navbar1.dart';
import 'package:bajulo/const/tema.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Tema().themedata,
      title: "bajulo",
      // initialRoute: homeScreen.x,
      home: Widget028(),
      // routes: {
      //   homeScreen.x:(context) => homeScreen(),
      // },
      debugShowCheckedModeBanner: false,
      
    );
  }
}
