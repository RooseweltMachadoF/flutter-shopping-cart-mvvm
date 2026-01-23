import 'package:shopping_cart/domain/entities/product/product_entity.dart';

import '../../../core/commands/command.dart';
import '../../../core/utils/result.dart';
import '../../../domain/usecases/get_products_use_case.dart';

class LoadProductsCommand extends Command<List<ProductEntity>> {
  final GetProductsUseCase _useCase;

  LoadProductsCommand(this._useCase);

  @override
  Future<void> execute() async {
    setLoading(true);
    setError(null);

    final result = await _useCase.execute();

    switch (result) {
      case Success(value: final products):
        setData(products);
      case Failure(exception: final e):
        setError(e.toString());
    }

    setLoading(false);
  }
}