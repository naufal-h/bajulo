import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/product_widget.dart';
import '../components/util/exception_handler.dart';
import '../components/util/snackbar_message.dart';
import '../controllers/orders_controller.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final products = cart.products.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) =>
                  ProductWidget(cartProduct: products[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartResume(context: context, cart: cart),
    );
  }
}

class CartResume extends StatefulWidget {
  const CartResume({
    Key? key,
    required this.context,
    required this.cart,
  }) : super(key: key);

  final BuildContext context;
  final Cart cart;

  @override
  State<CartResume> createState() => _CartResumeState();
}

class _CartResumeState extends State<CartResume> {
  bool _isCreating = false;

  Future<void> _createOrder(
      {required BuildContext context, required Cart cart}) async {
    if (cart.products.isEmpty) {
      SnackBarMessage(
        context: context,
        messageType: MessageType.info,
        messageText: 'There are no products in the cart',
        durationInSeconds: 1,
      );
    } else {
      setState(() => _isCreating = true);

      try {
        await Provider.of<OrdersController>(context, listen: false).addOrder(
          cart: widget.cart,
          clearCart: true,
        );
        setState(() => _isCreating = false);
        SnackBarMessage(
          context: context,
          messageType: MessageType.sucess,
          messageText: 'Order created successfully',
        );
      } on ExceptionHandler catch (error) {
        SnackBarMessage(
          context: context,
          messageType: MessageType.error,
          messageText: error.toString(),
        );
        setState(() => _isCreating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Color(0xFF1F1F1F),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Chip(
              backgroundColor: Colors.grey,
              label: Text(
                'Rp.${widget.cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            _isCreating
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      _createOrder(context: context, cart: widget.cart);
                    },
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    child: const Text("Checkout",
                        style: TextStyle(color: Color(0xFFD7FC70))),
                  )
          ],
        ),
      ),
    );
  }
}
