import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class cartItem extends StatelessWidget {
  const cartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0;i<2;i++)
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("assets/images/details_a1.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product title",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("XL",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),),
                    Text("Rp 10.000",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                    ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
