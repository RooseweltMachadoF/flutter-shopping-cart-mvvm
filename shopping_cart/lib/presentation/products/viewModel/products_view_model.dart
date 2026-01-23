import 'package:flutter/foundation.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';
import 'package:shopping_cart/domain/usecases/get_products_use_case.dart';
import 'package:shopping_cart/presentation/products/commands/loading_products_commad.dart';

class ProductsViewModel extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;
  late final LoadProductsCommand loadProductsCommand;

  List<ProductEntity> _filteredProducts = [];
  List<ProductEntity> get products => _filteredProducts;

  ProductsViewModel(this._getProductsUseCase) {
    loadProductsCommand = LoadProductsCommand(_getProductsUseCase);
    
    loadProductsCommand.addListener(() {
      _filteredProducts = loadProductsCommand.data ?? [];
      notifyListeners();
    });
  }

  bool get isLoading => loadProductsCommand.isLoading;
  String? get errorMessage => loadProductsCommand.error;

  Future<void> fetchProducts() async {
    await loadProductsCommand.execute();
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = loadProductsCommand.data ?? [];
    } else {
      _filteredProducts = (loadProductsCommand.data ?? [])
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    loadProductsCommand.dispose();
    super.dispose();
  }
}