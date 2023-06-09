import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo/models/cart.dart';

import '../../app_routes.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      child: IconButton(
        onPressed: () => Navigator.of(context).pushNamed(AppRoutes.cart),
        icon: const Icon(Icons.shopping_cart),
      ),
      builder: (ctx, cart, child) => Badge(
        value: cart.totalQuantityProducts.toString(),
        color: Colors.red,
        child: child!,
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color ?? Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
