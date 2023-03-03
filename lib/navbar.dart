import 'package:flutter/material.dart';

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
              "Menu",
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
          ListTile(
            leading: Icon(
              Icons.man,
              color: Color(0xFF404040),
            ),
            title: Text('Men'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.woman,
              color: Color(0xFF404040),
            ),
            title: Text('Women'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Color(0xFF404040),
            ),
            title: Text('Notifications'),
            onTap: () => null,
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
