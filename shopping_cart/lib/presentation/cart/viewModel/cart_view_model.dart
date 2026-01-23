import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';
import 'package:shopping_cart/presentation/order/order_view_model.dart';

class CartViewModel extends ChangeNotifier {
  final Map<int, int> _items = {}; 
  final List<ProductEntity> _productsInCart = [];

  List<ProductEntity> get products => _productsInCart;
  
  int getProductQuantity(int productId) => _items[productId] ?? 0;

  final Set<int> _loadingItems = {};

  bool isItemLoading(int productId) => _loadingItems.contains(productId);

  bool _isCheckingOut = false;
  bool get isCheckingOut => _isCheckingOut;

  bool addToCart(ProductEntity product) {
    if (!_items.containsKey(product.id) && _items.length >= 10) {
      debugPrint("Limite de 10 produtos diferentes atingido!");
      return false; 
    }

    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
      _productsInCart.add(product);
    }
    notifyListeners();
    return true;
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

  double get totalPrice {
  double total = 0.0;
  for (var product in _productsInCart) {
    total += (product.price * (_items[product.id] ?? 0));
  }
  return total;
}

  Future<void> removeItemWithSimulatedError(BuildContext context, int productId) async {
    _loadingItems.add(productId);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    bool hasApiError = true;
    _loadingItems.remove(productId);
    notifyListeners();

    if (hasApiError) {
      throw Exception("Erro ao remover item. Tente novamente.");
    }
    
  }

  Future<bool> checkout(BuildContext context) async {
    if (_productsInCart.isEmpty) return false;
    _isCheckingOut = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    final orderVM = Provider.of<OrderViewModel>(context, listen: false);
    orderVM.setLastOrder(List.from(_productsInCart), totalPrice);
    _items.clear();
    _productsInCart.clear();
    
    _isCheckingOut = false;
    notifyListeners();

    return true;
  }
}