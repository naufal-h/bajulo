import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/app_routes.dart';
import 'package:bajulo_new/components/app_drawer.dart';
import 'package:bajulo_new/components/product_item.dart';
import 'package:bajulo_new/components/util/custom_loading.dart';
import 'package:bajulo_new/components/util/custom_return.dart';
import 'package:bajulo_new/controllers/product_controller.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _reload = false;
  bool _isLoading = false;
  String _reloadMessage = 'No products found.';

  _reloadProducts() {
    setState(() => _isLoading = true);
    setState(() => _reload = false);
    Provider.of<ProductController>(context, listen: false)
        .loadProducts()
        .then((value) {
      if (value.returnType == ReturnType.error) {
        _reloadMessage = value.message;
        setState(() => _reload = true);
      } else {
        setState(() => _isLoading = false);
        setState(() => _reload = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Product'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Icon(Icons.refresh_outlined),
            onPressed: () {
              _reloadProducts();
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: CustomLoading(context: context).builder(
        condition: _isLoading,
        loadingMessage: 'Loading products...',
        showReloadButton: _reload,
        reloadMessage: _reloadMessage,
        reloadButtonLabel: 'Reload',
        reloadMethod: _reloadProducts,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productList.itemsCount,
            itemBuilder: (cti, index) =>
                ProductItem(product: productList.products[index]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(AppRoutes.productForm),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
