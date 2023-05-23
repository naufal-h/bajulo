import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/components/cart/cart_button.dart';
import 'package:bajulo_new/components/util/exception_handler.dart';
import 'package:bajulo_new/components/util/snackbar_message.dart';
import 'package:bajulo_new/controllers/product_controller.dart';
import 'package:bajulo_new/models/cart.dart';
import 'package:bajulo_new/models/product.dart';
import 'package:bajulo_new/app_routes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text("Produk", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [
          Consumer<ProductController>(
            builder: (context, productController, _) {
              final isFavorite = product.isFavorite;

              return IconButton(
                onPressed: () async {
                  try {
                    await productController.toggleFavorite(product);
                  } on ExceptionHandler catch (error) {
                    SnackBarMessage(
                      context: context,
                      messageText: error.toString(),
                      messageType: MessageType.error,
                    );
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 64,
                  margin: EdgeInsets.only(right: 14),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .addProduct(product, 1);
                      Navigator.of(context).pushNamed(AppRoutes.cart);
                    },
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.white,
              child: PageView(
                children: [
                  Image.network(
                    product.urlImage,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    product.urlImage,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    product.urlImage,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'poppins',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 14),
                  child: Text(
                    'Rp. ${product.price}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'poppins',
                        color: Theme.of(context).colorScheme.error),
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), height: 150 / 100),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  childrenPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  title: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                    ),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 52, top: 12, bottom: 6),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'See More Reviews',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
