import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';
import '../controllers/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Home'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNav),
          ),
          Divider(),
          ExpansionTile(
            collapsedTextColor: Theme.of(context).colorScheme.tertiary,
            textColor: Theme.of(context).colorScheme.tertiary,
            iconColor: Theme.of(context).colorScheme.tertiary,
            title: Text('Shop'),
            leading: Icon(
              Icons.shop_2_sharp,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.new_releases,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                title: Text('New Arrival'),
                onTap: () => {},
              ),
              ExpansionTile(
                collapsedTextColor: Theme.of(context).colorScheme.tertiary,
                textColor: Theme.of(context).colorScheme.tertiary,
                iconColor: Theme.of(context).colorScheme.tertiary,
                title: Text('Men'),
                leading: Icon(
                  Icons.man,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                children: [
                  ListTile(
                    title: Text("Tops"),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Text("Bottoms"),
                    onTap: () => {},
                  ),
                ],
              ),
              ExpansionTile(
                collapsedTextColor: Theme.of(context).colorScheme.tertiary,
                textColor: Theme.of(context).colorScheme.tertiary,
                iconColor: Theme.of(context).colorScheme.tertiary,
                title: Text('Women'),
                leading: Icon(
                  Icons.man,
                  color: Color(0xFF404040),
                ),
                children: [
                  ListTile(
                    title: Text("Tops"),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Text("Bottoms"),
                    onTap: () => {},
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment_sharp,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text("Orders"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.orders),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.mode_edit_sharp,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text("Edit Products"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.products),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Settings'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Returns Policy'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app_sharp,
                  color: Theme.of(context).colorScheme.tertiary),
              title: Text('Logout'),
              onTap: () {
                Provider.of<AuthController>(context, listen: false).logout();
                Navigator.restorablePushNamedAndRemoveUntil(
                  context,
                  AppRoutes.landing,
                  (route) => false,
                );
              }),
        ],
      ),
    );
  }
}
