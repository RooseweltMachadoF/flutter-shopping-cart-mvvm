import 'package:provider/provider.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';
import '../../../domain/usecases/get_products_use_case.dart';
import '../../../data/repositories/products_repository/products_repository.dart';
import '../viewModel/products_view_model.dart';


 ChangeNotifierProvider<ProductsViewModel> makeProductController() {
    return ChangeNotifierProvider<ProductsViewModel>(
      create: (context) {
        final repository = ProductsRepository(
          Provider.of<IApiRepositories>(context, listen: false),
        );

        final useCase = GetProductsUseCase(repository);

        return ProductsViewModel(useCase);
      },
    );
  }