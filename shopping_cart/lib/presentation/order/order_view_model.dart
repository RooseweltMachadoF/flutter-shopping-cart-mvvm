import 'package:flutter/material.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';

class OrderViewModel extends ChangeNotifier {
  final List<ProductEntity> _lastOrderItems = [];
  double _lastOrderSubtotal = 0;

  List<ProductEntity> get lastOrderItems => _lastOrderItems;
  double get subtotal => _lastOrderSubtotal;
  double get freight => 15.0;
  double get total => _lastOrderSubtotal + freight;

  void setLastOrder(List<ProductEntity> items, double subtotal) {
    _lastOrderItems.clear();
    _lastOrderItems.addAll(items);
    _lastOrderSubtotal = subtotal;
    notifyListeners();
  }
}