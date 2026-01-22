import 'package:flutter/material.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';

class OrderViewModel extends ChangeNotifier {
  final List<ProductModel> _lastOrderItems = [];
  double _lastOrderSubtotal = 0;

  List<ProductModel> get lastOrderItems => _lastOrderItems;
  double get subtotal => _lastOrderSubtotal;
  double get freight => 15.0;
  double get total => _lastOrderSubtotal + freight;

  void setLastOrder(List<ProductModel> items, double subtotal) {
    _lastOrderItems.clear();
    _lastOrderItems.addAll(items);
    _lastOrderSubtotal = subtotal;
    notifyListeners();
  }
}