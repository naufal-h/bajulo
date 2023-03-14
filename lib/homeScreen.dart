import 'package:flutter/material.dart';
import 'homeBody.dart';

class homeScreen extends StatefulWidget {
  @override
  static const x='/homeScreen';
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return home_body();
  }
}
