import 'package:bajulo/cart.dart';
import 'package:bajulo/navbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:bajulo/widget028Bottom.dart';
import 'package:bajulo/userTile.dart';

class policy extends StatefulWidget {
  @override
  _policyPageState createState() => _policyPageState();
}

class _policyPageState extends State<policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Returns Policy", style: TextStyle(fontFamily: "Poppins")),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Center(
          child: Column(children: [
            Text(
              "\nYou can get in touch with us by visiting our FAQ page by clicking here, you will need to locate and click on the question that match your query before being able to see our contact form or our chat support service. We will respond within the next working day – Monday to Sunday: 9:00 – 18:00. Please be aware that all our e-mails are conducted in English.\n\nNothing in this returns policy affects your statutory rights. Your rights under this returns policy are in addition to your cancellation rights under the Consumer Contracts (Information, Cancellation and Additional Charges) Regulations 2013.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5,
                  wordSpacing: 1.1,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
          ]),
        ),
      ),
    );
  }
}
