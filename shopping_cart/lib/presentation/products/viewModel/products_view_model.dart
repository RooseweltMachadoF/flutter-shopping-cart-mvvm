import 'package:flutter/material.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';
import 'package:shopping_cart/data/repositories/products_repository/products_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductsRepository _repository;

  ProductsViewModel(this._repository);

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _repository.getProducts();
    } catch (e) {
      _errorMessage = "Não foi possível carregar os produtos. Tente novamente.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      fetchProducts();
    } else {
      _products = _products
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}