import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/product_widget.dart';
import '../models/order.dart';

class OrderItemWidget extends StatefulWidget {
  final Order order;
  const OrderItemWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
            title: Text('Rp. ${widget.order.total.toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (match) => '${match[1]}.',
                )}'),
            subtitle: Text(widget.order.id),
            trailing:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: (widget.order.products.length * 85) + 10,
              child: ListView(
                children: widget.order.products
                    .map((product) => ProductWidget(
                        cartProduct: product, onlyProductList: true))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
