import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/product_model.dart';

class ShoppingCartController extends ChangeNotifier {
  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => List.from(_cartItems);

  // Add a product to the shopping cart
  void addToCart(ProductModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // Remove a product from the shopping cart
  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Get the total number of items in the shopping cart
  int get cartItemCount => _cartItems.length;

  // Get the total price of items in the shopping cart
  double get cartTotalPrice {
    double totalPrice = 0;
    for (ProductModel product in _cartItems) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

  // Format a double value to currency format (you can customize this further)
  String toCurrencyFormat(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }
}
