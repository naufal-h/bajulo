import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/cart_product.dart';

class ProductWidget extends StatelessWidget {
  final CartProduct cartProduct;
  final bool onlyProductList;
  const ProductWidget({
    Key? key,
    required this.cartProduct,
    this.onlyProductList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onlyProductList) {
      return ProductData(cartProduct: cartProduct);
    } else {
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Theme.of(context).errorColor.withAlpha(60),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
            size: 50,
          ),
        ),
        confirmDismiss: (direction) {
          return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Confirm'),
              content:
                  Text('Confirm the deletion of ${cartProduct.productName}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          );
        },
        onDismissed: (direction) => {
          Provider.of<Cart>(
            context,
            listen: false,
          ).removeAllProducts(cartProduct.productId)
        },
        child: ProductData(cartProduct: cartProduct),
      );
    }
  }
}

class ProductData extends StatelessWidget {
  const ProductData({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: SizedBox(
          width: 90,
          height: 90,
          child: Image.network(
            cartProduct.productUrlImage,
            alignment: Alignment.center,
          ),
        ),
        title: Text(cartProduct.productName),
        subtitle: Text(
            'Total: Rp. ${(cartProduct.quantity * cartProduct.productPrice).toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (match) => '${match[1]}.',
                )}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
                'Total: Rp. ${cartProduct.productPrice.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (match) => '${match[1]}.',
                    )}'),
            Text('Qty: ${cartProduct.quantity}x')
          ],
        ),
      ),
    );
  }
}