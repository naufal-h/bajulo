import 'package:bajulo/cartBottomNavbar.dart';
import 'package:bajulo/homeBody.dart';
import 'package:bajulo/homeScreen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'order_hist_item.dart';

class order_hist extends StatelessWidget {
  const order_hist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          AppBar(
            title: Text("Order History"),
          ),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            // decoration: BoxDecoration(
            //   color: Colors.grey.shade700,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(35),
            //     topRight: Radius.circular(35),
            //   )
            // ),
            child: Column(children: [
              order_hist_item(),
            ]),
          )
        ],
      ),
    );
  }
}
