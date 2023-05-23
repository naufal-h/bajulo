import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_drawer.dart';
import '../components/order_item_widget.dart';
import '../components/util/custom_loading.dart';
import '../controllers/orders_controller.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var isLoading = false;
  var reload = false;

  Future<void> _loadOrders() async {
    setState(() => isLoading = true);
    setState(() => reload = false);
    Provider.of<OrdersController>(context, listen: false)
        .loadOrders()
        .then((value) {
      if (value == false) {
        setState(() => reload = true);
      } else {
        setState(() => isLoading = false);
        setState(() => reload = false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final OrdersController ordersController = Provider.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("My Orders", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: CustomLoading(context: context).builder(
        condition: isLoading,
        loadingMessage: 'Loading...',
        showReloadButton: reload,
        reloadMessage: 'No orders found.',
        reloadButtonLabel: 'Reload',
        reloadMethod: _loadOrders,
        child: RefreshIndicator(
          onRefresh: _loadOrders,
          child: ListView.builder(
            itemCount: ordersController.products.length,
            itemBuilder: (ctx, index) =>
                OrderItemWidget(order: ordersController.products[index]),
          ),
        ),
      ),
    );
  }
}
