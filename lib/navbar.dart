import 'package:flutter/material.dart';
import 'package:bajulo/notif.dart';

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
            color: Color(0xFF404040),
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
          Divider(),
          ListTile(
            leading: Icon(
              Icons.new_releases,
              color: Color(0xFF404040),
            ),
            title: Text('New Arrival'),
            onTap: () => null,
          ),
          Divider(),
          ExpansionTile(
            title: Text('Men'),
            leading: Icon(
              Icons.man,
              color: Color(0xFF404040),
            ),
            children: [
              ListTile(
                title: Text("Tops"),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                title: Text("Bottoms"),
                onTap: () => null,
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
              Divider(),
              ListTile(
                title: Text("Bottoms"),
                onTap: () => null,
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Color(0xFF404040),
            ),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notif()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFF404040),
            ),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Color(0xFF404040),
            ),
            title: Text('Policies'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
