import 'package:flutter/material.dart';
import 'package:odin/models/cart.dart';
import 'package:odin/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _cart = [];

  List<Cart> get cart => _cart;

  void addToCart(Product product) {
    if (_cart.any((element) => element.product.id == product.id)) {
      _cart.singleWhere((element) => element.product.id == product.id).amount++;
    } else {
      _cart.add(Cart(product, 1));
    }

    notifyListeners();
  }
}
