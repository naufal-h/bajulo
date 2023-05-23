import 'package:flutter/material.dart';

import '../app_routes.dart';

class ScreenNotFound extends StatelessWidget {
  final String screenName;
  const ScreenNotFound(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const <Widget>[
            Icon(Icons.error),
            SizedBox(width: 20),
            Text("Error"),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Screen not found",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 15),
              Text('Route: $screenName'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.restorablePushNamedAndRemoveUntil(
            context,
            AppRoutes.landing,
            (route) => false,
          );
        },
        label: const Text('Home Screen'),
        icon: const Icon(Icons.home),
      ),
    );
  }
}
