import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/widgets.dart';
import '../components/util/exception_handler.dart';
import '../controllers/auth_controller.dart';
import '../data/firebase_consts.dart';
import '../models/cart.dart';
import '../models/cart_product.dart';
import '../models/order.dart';

class OrdersController with ChangeNotifier {
  final AuthData _authData;
  final List<Order> _products;

  OrdersController(this._authData, this._products);

  List<Order> get products {
    return [..._products];
  }

  int get ordersCount {
    return _products.length;
  }

  Future<bool> loadOrders() async {
    final response = await get(
      Uri.parse(
          '${FirebaseConsts.orderUrl}/${_authData.userId}.json/?auth=${_authData.token}'),
    );

    if (response.body == 'null') {
      return false;
    } else {
      Map<String, dynamic> orderData = jsonDecode(response.body);

      _products.clear();

      orderData.forEach(
        (orderId, orderData) {
          _products.add(
            Order(
              id: orderId,
              date: DateTime.parse(orderData['date']),
              total: orderData['total'],
              products:
                  (orderData['products'] as List<dynamic>).map((productOrder) {
                return CartProduct(
                  id: productOrder['id'],
                  productId: productOrder['productId'],
                  productName: productOrder['productName'],
                  productPrice: productOrder['productPrice'],
                  productUrlImage: productOrder['productUrlImage'],
                  quantity: productOrder['quantity'],
                );
              }).toList(),
            ),
          );
        },
      );
      notifyListeners();
      return true;
    }
  }

  Future<void> addOrder({required Cart cart, required bool clearCart}) async {
    final date = DateTime.now();
    final response = await post(
      // http.post
      Uri.parse(
          '${FirebaseConsts.orderUrl}/${_authData.userId}.json/?auth=${_authData.token}'),
      body: jsonEncode({
        'total': cart.totalAmount,
        'date': date.toIso8601String(),
        'products': cart.products.values.map((cartProduct) {
          return {
            'id': cartProduct.id,
            'productId': cartProduct.productId,
            'productName': cartProduct.productName,
            'productPrice': cartProduct.productPrice,
            'productUrlImage': cartProduct.productUrlImage,
            'quantity': cartProduct.quantity,
          };
        }).toList()
      }),
    );

    if (response.statusCode >= 400) {
      throw ExceptionHandler(
        handledMessage: 'Error when trying to save the new order.',
        statusCode: response.statusCode,
      );
    } else {
      String orderId = jsonDecode(response.body)['name'];
      if (orderId.isEmpty) {
        throw ExceptionHandler(
          handledMessage: 'Internal error when trying to save the new order.',
          statusCode: 000,
        );
      } else {
        _products.insert(
            0,
            Order(
              id: orderId,
              total: cart.totalAmount,
              date: date,
              products: cart.products.values.toList(),
            ));

        if (clearCart) {
          cart.clear();
        }
        notifyListeners();
      }
    }
  }
}
