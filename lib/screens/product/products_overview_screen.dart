import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/components/app_drawer.dart';
import 'package:bajulo_new/components/cart/cart_button.dart';
import 'package:bajulo_new/components/util/custom_loading.dart';
import 'package:bajulo_new/components/util/custom_return.dart';
import 'package:bajulo_new/controllers/product_controller.dart';
import '../../components/product_grid/product_grid.dart';

enum FilterOptions { all, onlyFavorites }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  bool _isLoading = true;
  bool _reload = false;
  String _reloadMessage = 'No products found.';

  Future<void> _loadProducts() async {
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
      }
    });
  }

  @override
  initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(child: Text("")),
        actions: [
          const CartButton(),
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz_sharp),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                _showOnlyFavorites =
                    selectedValue == FilterOptions.onlyFavorites;
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.all,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.apps_rounded,
                        color: Theme.of(context).colorScheme.tertiary),
                    const SizedBox(width: 5),
                    const Text('All', textAlign: TextAlign.left),
                  ],
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.onlyFavorites,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.favorite_border_rounded,
                        color: Theme.of(context).colorScheme.tertiary),
                    const SizedBox(width: 5),
                    const Text('Favorites', textAlign: TextAlign.left),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: CustomLoading(context: context).builder(
        condition: _isLoading,
        loadingMessage: 'Loading products...',
        showReloadButton: _reload,
        reloadMessage: _reloadMessage,
        reloadButtonLabel: 'Load again',
        reloadMethod: _loadProducts,
        child: RefreshIndicator(
          onRefresh: () => _loadProducts(),
          child: ProductGrid(showOnlyFavorites: _showOnlyFavorites),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
