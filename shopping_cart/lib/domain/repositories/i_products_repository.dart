
import 'package:shopping_cart/domain/entities/product/product_entity.dart';

abstract interface class IProductsRepository {
  Future<List<ProductEntity>> getProducts();
}