import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/app_routes.dart';
import 'package:bajulo_new/components/util/exception_handler.dart';
import 'package:bajulo_new/components/util/snackbar_message.dart';
import 'package:bajulo_new/controllers/product_controller.dart';
import 'package:bajulo_new/models/cart.dart';
import 'package:bajulo_new/models/product.dart';

class ProdutctGridItem extends StatelessWidget {
  const ProdutctGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: GridTile(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productDetail,
                  arguments: product,
                );
              },
              // imagem
              child: Image.network(
                product.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Consumer<Product>(
                builder: (ctx, product, _) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      try {
                        await Provider.of<ProductController>(
                          ctx,
                          listen: false,
                        ).toggleFavorite(product);
                      } on ExceptionHandler catch (error) {
                        SnackBarMessage(
                          context: ctx,
                          messageText: error.toString(),
                          messageType: MessageType.error,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        footer: GridTileBar(
          backgroundColor: Colors.grey.shade700,
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Rp. ${product.price.toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (match) => '${match[1]}.',
                )}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_bag),
            color: Colors.white,
            onPressed: () {
              SnackBarMessage(
                context: context,
                messageType: MessageType.info,
                messageText: '${product.name} added to cart.',
                durationInSeconds: 1,
                action: SnackBarAction(
                  label: 'UNDO',
                  textColor: Colors.white,
                  onPressed: () => cart.removeSingleProduct(product),
                ),
              );

              cart.addProduct(product, 1);
            },
          ),
        ),
      ),
    );
  }
}
