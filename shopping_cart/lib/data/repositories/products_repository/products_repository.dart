import 'package:shopping_cart/data/models/api_response_model.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';
import 'package:shopping_cart/domain/repositories/i_products_repository.dart';

class ProductsRepository implements IProductsRepository{
  final IApiRepositories _api;
  
  ProductsRepository(this._api);

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {

      final (String? error,ApiResponseModel<List>? response,) = await _api.get('/products');

      if (response != null) {
      final List rawList = response.data;

      return rawList.map((json) => ProductModel.fromJson(json).toEntity()).toList();
    }
      
      return [];
    } catch (e) {
      rethrow; 
    }
  }
}