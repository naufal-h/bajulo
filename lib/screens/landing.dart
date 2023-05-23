import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../screens/auth_screen.dart';
import '../screens/product/products_overview_screen.dart';
import '../components/bottom_nav.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Provider.of(context);
    return FutureBuilder(
      future: authController.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(child: Text('error'));
        } else {
          return authController.authData.isAuthenticated == false
              ? const AuthScreen()
              : const BottomNav();
        }
      },
    );
  }
}
