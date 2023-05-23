import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../components/util/custom_return.dart';
import '../components/util/exception_handler.dart';
import '../controllers/auth_controller.dart';
import '../data/firebase_consts.dart';
import '../models/product.dart';

class ProductController with ChangeNotifier {
  final AuthData authData;

  final List<Product> _products;

  ProductController(this.authData, this._products);

  List<Product> get favoriteProducts =>
      [...products.where((p) => p.isFavorite)];

  List<Product> get products => [..._products];

  int get itemsCount {
    return _products.length;
  }

  Future<CustomReturn> loadProducts() async {
    final response = await get(
      Uri.parse('${FirebaseConsts.productUrl}.json?auth=${authData.token}'),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 401) {
      return CustomReturn.unauthorizedError();
    } else {
      if (response.statusCode > 400) {
        return CustomReturn(
            returnType: ReturnType.error, message: 'Error when loading data.');
      } else {
        final favoriteProductsResponse = await get(
          Uri.parse(
              '${FirebaseConsts.favoriteUserProductUrl}/${authData.userId}.json?auth=${authData.token}'),
        );

        Map<String, dynamic> favoriteProductsData =
            favoriteProductsResponse.body == 'null'
                ? {}
                : jsonDecode(favoriteProductsResponse.body);

        _products.clear();
        data.forEach((productId, productData) {
          _products.add(
            Product(
              id: productId,
              name: productData['name'],
              description: productData['description'],
              price: productData['price'].toDouble(),
              urlImage: productData['urlImage'],
              isFavorite: favoriteProductsData[productId] ?? false,
            ),
          );
        });
        notifyListeners();
        return CustomReturn.sucess();
      }
    }
  }

  Future<void> removeProduct({required Product product}) async {
    int index = _products.indexWhere((p) => p.id == product.id);

    if (index == -1) {
      throw ExceptionHandler(
        handledMessage: 'Internal error, product not found.',
        statusCode: 000,
      );
    } else {
      // http.delete
      final response = await delete(
        Uri.parse(
            '${FirebaseConsts.productUrl}/${product.id}.json?auth=${authData.token}'),
      );

      if (response.statusCode < 400) {
        _products.removeWhere((p) => p.id == product.id);
        notifyListeners();
      } else {
        throw ExceptionHandler(
          handledMessage: 'Error when deleting product.',
          statusCode: response.statusCode,
        );
      }
    }
  }

  Future<void> saveProduct({required Product product}) async {
    if (product.id == '') {
      _addProduct(product: product);
    } else {
      _updateProduct(product: product);
    }
  }

  Future<void> _updateProduct({required Product product}) async {
    int index = _products.indexWhere((p) => p.id == product.id);

    if (index == -1) {
      throw ExceptionHandler(
        handledMessage: 'Internal error, product not found.',
        statusCode: 000,
      );
    } else {
      final Response response;
      // http.patch
      response = await patch(
        Uri.parse(
            '${FirebaseConsts.productUrl}/${product.id}.json?auth=${authData.token}'),
        body: jsonEncode({
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'urlImage': product.urlImage
        }),
      );

      if (response.statusCode < 400) {
        _products[index] = product;
        notifyListeners();
      } else {
        throw ExceptionHandler(
          handledMessage: 'Internal error when updating product.',
          statusCode: 000,
        );
      }
    }
  }

  Future<void> _addProduct({required Product product}) async {
    final response = await post(
      // http.post
      Uri.parse('${FirebaseConsts.productUrl}.json?auth=${authData.token}'),
      body: jsonEncode(
        {
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'urlImage': product.urlImage
        },
      ),
    );

    if (response.statusCode >= 400) {
      throw ExceptionHandler(
        handledMessage: 'Error when saving product, please try again later.',
        statusCode: response.statusCode,
      );
    } else {
      String id = jsonDecode(response.body)['name'];
      if (id.isEmpty) {
        throw ExceptionHandler(
          handledMessage: 'Internal error when saving product.',
          statusCode: 000,
        );
      } else {
        product.id = id;
        _products.add(product);
        notifyListeners();
      }
    }
  }

  Future<void> toggleFavorite(Product product) async {
    product.toggleFavorite();

    final response = await put(
      Uri.parse(
          '${FirebaseConsts.favoriteUserProductUrl}/${authData.userId}/${product.id}.json?auth=${authData.token}'),
      body: jsonEncode(product.isFavorite),
    );

    if (response.statusCode < 400) {
      notifyListeners();
    } else {
      product.toggleFavorite();
      throw ExceptionHandler(
        handledMessage: 'Error when saving the product.',
        statusCode: response.statusCode,
      );
    }
  }

  static Product dataToProduct({required Map<String, Object> data}) {
    return Product(
      id: data['id'] == null ? '' : data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      urlImage: data['urlImage'] as String,
    );
  }
}
