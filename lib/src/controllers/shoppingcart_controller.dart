import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ShoppingCartController extends ChangeNotifier {
  List<ProductModel> _selectedItems = [];

  List<ProductModel> get selectedItems => _selectedItems;

  void addToCart(ProductModel product) {
    _selectedItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _selectedItems.remove(product);
    notifyListeners();
  }

  String toCurrencyFormat(double price) {
    return '\$$price';
  }
}
