import 'package:flutter/material.dart';

class productImg extends StatelessWidget {
  final String imageUrl;

  const productImg({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      body: Center(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
