import 'package:flutter/material.dart';
import 'package:odin/models/cart.dart';
import 'package:odin/models/product.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart([]);

  Cart get cart => _cart;

  void addToCart(Product product) {
    _cart.products.add(product);

    notifyListeners();
  }
}
