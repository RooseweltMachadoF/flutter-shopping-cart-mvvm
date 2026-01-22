import 'package:shopping_cart/data/models/api_response_model.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';

class ProductsRepository {
  final IApiRepositories _api;
  
  ProductsRepository(this._api);

  Future<List<ProductModel>> getProducts() async {
    try {

      final (String? error,ApiResponseModel<List>? response,) = await _api.get('/products');

      if (response != null) {
      final List rawList = response.data;

      return rawList.map((json) => ProductModel.fromJson(json)).toList();
    }
      
      return [];
    } catch (e) {
      rethrow; 
    }
  }
}