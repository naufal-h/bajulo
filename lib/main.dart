import 'package:bajulo/login fix.dart';
import 'package:flutter/material.dart';
import 'package:bajulo/const/tema.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'auth_page.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
    ChangeNotifierProvider(
      create: (ctx) => Auth()),
    // ChangeNotifierProvider(
    //   create: (ctx) => Products()),

    ],
    
      builder: (context, child) => MaterialApp(
        theme: Tema().themedata,
      title: "bajulo",
      // initialRoute: homeScreen.x,
      home: LoginPage(),
      // routes: {
      //   homeScreen.x:(context) => homeScreen(),
      // },
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
