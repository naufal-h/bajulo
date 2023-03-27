import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class order_hist_item extends StatelessWidget {
  const order_hist_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("Order History"),
        for (int i = 0; i < 3; i++)
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "10 Mar 2023",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Black Hoodie",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 164, 193, 84),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Buy Again",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
