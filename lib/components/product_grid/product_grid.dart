import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/components/product_grid/product_grid_item.dart';

import '../../models/product.dart';
import '../../controllers/product_controller.dart';

class ProductGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  const ProductGrid({required this.showOnlyFavorites});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);

    final List<Product> loadedProducts =
        showOnlyFavorites ? provider.favoriteProducts : provider.products;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProdutctGridItem(),
      ),
    );
  }
}
