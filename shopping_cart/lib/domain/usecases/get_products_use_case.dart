import 'package:shopping_cart/domain/entities/product/product_entity.dart';
import 'package:shopping_cart/domain/repositories/i_products_repository.dart';

import '../../core/utils/result.dart';

class GetProductsUseCase {
  final IProductsRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>, Exception>> execute() async {
    try {
      final products = await _repository.getProducts();
      return Success(products);
    } catch (e) {
      return Failure(Exception('Erro ao carregar produtos: $e'));
    }
  }
}