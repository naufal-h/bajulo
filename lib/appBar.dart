import 'package:flutter/material.dart';

class appBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 30.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 30),
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            // kembali
          },
        ),
        title: Text("", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
    );
  }
}
