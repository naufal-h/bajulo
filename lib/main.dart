import 'package:bajulo/screens/search_screen.dart';
import 'package:bajulo/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo/const/tema.dart';
import 'package:bajulo/app_routes.dart';
import 'package:bajulo/controllers/auth_controller.dart';
import 'package:bajulo/controllers/orders_controller.dart';
import 'package:bajulo/controllers/product_controller.dart';
import 'package:bajulo/screens/auth_screen.dart';
import 'package:bajulo/screens/cart_screen.dart';
import 'package:bajulo/screens/landing.dart';
import 'package:bajulo/screens/orders_screen.dart';
import 'package:bajulo/screens/product/product_detail_screen.dart';
import 'package:bajulo/screens/product/product_form_screen.dart';
import 'package:bajulo/screens/product/products_screen.dart';
import 'package:bajulo/screens/product/products_overview_screen.dart';
import 'package:bajulo/screens/screen_not_found.dart';
import 'package:bajulo/screens/notif_screen.dart';
import 'package:bajulo/components/bottom_nav.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProxyProvider<AuthController, ProductController>(
          create: (_) => ProductController(AuthData.emptyData(), []),
          update: (ctx, authController, previous) {
            return ProductController(
              authController.authData,
              previous?.products ?? [],
            );
          },
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProxyProvider<AuthController, OrdersController>(
          create: (_) => OrdersController(AuthData.emptyData(), []),
          update: (ctx, authController, previous) {
            return OrdersController(
              authController.authData,
              previous?.products ?? [],
            );
          },
        ),
      ],
      child: MaterialApp(
        theme: Tema().themedata,
        title: 'bajuLo!',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.landing: (ctx) => const Landing(),
          AppRoutes.auth: (ctx) => const AuthScreen(),
          AppRoutes.productOverview: (ctx) => const ProductsOverviewScreen(),
          AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
          AppRoutes.cart: (ctx) => const CartScreen(),
          AppRoutes.orders: (ctx) => const OrdersScreen(),
          AppRoutes.products: (ctx) => const ProductsScreen(),
          AppRoutes.productForm: (ctx) => const ProductFormScreen(),
          AppRoutes.bottomNav: (ctx) => const BottomNav(),
          AppRoutes.notif: (ctx) => const NotifScreen(),
          AppRoutes.search: (ctx) => SearchScreen(),
          AppRoutes.user: (ctx) => UserScreen(),
        },
        initialRoute: AppRoutes.landing,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) {
            return ScreenNotFound(settings.name.toString());
          });
        },
      ),
    );
  }
}
