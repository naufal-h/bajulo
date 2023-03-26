import 'package:bajulo/layout gridview/categoryMenBottom.dart';
import 'package:bajulo/layout gridview/categoryMenTop.dart';
import 'package:bajulo/layout%20gridview/categoryAll.dart';
import 'package:bajulo/layout%20gridview/categoryMenBottom.dart';
import 'package:bajulo/layout%20gridview/categoryMenTop.dart';
import 'package:bajulo/layout%20gridview/categoryAll.dart';
import 'package:bajulo/order_hist.dart';
import 'package:bajulo/product_details.dart';
import 'package:flutter/material.dart';
import 'package:bajulo/notif.dart';
import 'order_hist.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: 110,
            color: Theme.of(context).colorScheme.tertiary,
            alignment: Alignment.bottomCenter,
            child: Text(
              "MENU",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.new_releases,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('New Arrival'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const categorydetails()))
            },
          ),
          Divider(),
          ExpansionTile(
            title: Text('Men'),
            leading: Icon(
              Icons.man,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            children: [
              ListTile(
                title: Text("Tops"),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const categoryMenTop()))
                },
              ),
              ListTile(
                title: Text("Bottoms"),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const categoryMenBottom()))
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Women'),
            leading: Icon(
              Icons.man,
              color: Color(0xFF404040),
            ),
            children: [
              ListTile(
                title: Text("Tops"),
                onTap: () => null,
              ),
              ListTile(
                title: Text("Bottoms"),
                onTap: () => null,
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.note,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text("Order History"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const order_hist()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Policies'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
