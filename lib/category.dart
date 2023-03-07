import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            press: () {},
            text: "New Arrival",
          ),
          // SizedBox(
          //   height: 20,
          // ),
          categoryProduct(
            press: () {},
            text: "Mens",
          ),
          SizedBox(
            width: 0,
          ),
          categoryProduct(
            press: () {},
            text: "Womens",
          ),
          SizedBox(
            height: 20,
          ),
          categoryProduct(
            press: () {},
            text: "All",
          ),
          SizedBox(
            height: 20,
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
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
              backgroundColor: Color(0xffD7FC70),
              label: Row(
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(),
                  ),
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
