import 'package:flutter/material.dart';
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}



class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryProduct(
            press: (){},
            text: "text",
            
          ),
          // SizedBox(
          //   height: 20,
          // ),
          categoryProduct(
            press: (){},
            text: "text2",
          ),
          SizedBox(
            width: 0,
          ),
          categoryProduct(
            press: (){},
            text: "text3",
          ),
          SizedBox(
            height: 20,
          ),
          categoryProduct(
            press: (){},
            text: "text4",
          ),
          SizedBox(
            height: 20,
          ),
          categoryProduct(
            press: (){},
            text: "text5",
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class categoryProduct extends StatelessWidget {
  const categoryProduct({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(label: Row(
            children: [
              Text(text),
              SizedBox(
                width: 50,
              )
            ],
          )),
          
        ),
      ),
    );
  }
}