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
      body: CustomLoading(
        context: context,
      ).builder(
        condition: _isLoading,
        loadingMessage: 'Loading products...',
        showReloadButton: _reload,
        reloadMessage: _reloadMessage,
        reloadButtonLabel: 'Load again',
        reloadMethod: _loadProducts,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 152.0),
              items: [6, 7, 8].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage("assets/images/asset $i.jpg"),
                              fit: BoxFit.fitWidth)),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryProduct(
                    press: () => {},
                    text: "New Arrival",
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  categoryProduct(
                    press: () => {},
                    text: "Men",
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  categoryProduct(
                    press: () => {},
                    text: "Womens",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  categoryProduct(
                    press: () => {},
                    text: "All",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _loadProducts(),
                child: ProductGrid(showOnlyFavorites: _showOnlyFavorites),
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

class categoryProduct extends StatelessWidget {
  const categoryProduct({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
              backgroundColor: Theme.of(context).primaryColor,
              label: Row(
                children: [
                  Text(
                    text,
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
