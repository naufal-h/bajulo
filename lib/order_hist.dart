import 'package:bajulo/cart.dart';
import 'package:bajulo/cartBottomNavbar.dart';
import 'package:bajulo/homeBody.dart';
import 'package:bajulo/homeScreen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'order_hist_item.dart';

class order_hist extends StatelessWidget {
  const order_hist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Order History", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon:
                SvgPicture.asset('assets/icons/cart.svg', color: Colors.white),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const cart()))
            },
          ),
        ],
      ),
      body: ListView(
        children: [
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
