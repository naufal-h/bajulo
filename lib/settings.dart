import 'package:bajulo/cart.dart';
import 'package:bajulo/navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:bajulo/widget028Bottom.dart';
import 'package:bajulo/userTile.dart';
import 'package:bajulo/settingsTile.dart';
import 'package:bajulo/user.dart';
import 'package:bajulo/main.dart';

class settings extends StatefulWidget {
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'Settings',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 6 / 100,
                    fontWeight: FontWeight.w600),
              ),
            ),
            userTile(
              onTap: () {},
              margin: EdgeInsets.only(top: 10),
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: 'View Mode',
              subtitle: 'Activate dark mode',
            ),
            userTile(
              margin: EdgeInsets.only(top: 0),
              onTap: () {},
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
              title: 'Language',
              subtitle: 'Choose your language',
            ),
            userTile(
              margin: EdgeInsets.only(top: 0),
              onTap: () {},
              icon: Icon(
                Icons.description,
                color: Colors.white,
              ),
              title: 'Image Quality',
              subtitle: 'Set image quality that you seen',
            ),
          ],
        ),
      ),
    );
  }
}
