import 'package:flutter/material.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final Map<int, int> _items = {}; 
  final List<ProductModel> _productsInCart = [];

  List<ProductModel> get products => _productsInCart;
  
  int getProductQuantity(int productId) => _items[productId] ?? 0;

  void addToCart(ProductModel product) {
    if (!_items.containsKey(product.id) && _items.length >= 10) {
      debugPrint("Limite de 10 produtos diferentes atingido!");
      return; 
    }

    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
      _productsInCart.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]! > 1) {
        _items[productId] = _items[productId]! - 1;
      } else {
        _items.remove(productId);
        _productsInCart.removeWhere((p) => p.id == productId);
      }
      notifyListeners();
    }
  }
}