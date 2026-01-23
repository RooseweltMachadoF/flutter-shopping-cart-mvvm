import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/core/utils/result.dart';
import 'package:shopping_cart/domain/usecases/get_products_use_case.dart';
import 'package:shopping_cart/presentation/products/viewModel/products_view_model.dart';

class MockGetProductsUseCase extends Mock implements GetProductsUseCase {}

void main() {
  late ProductsViewModel viewModel;
  late MockGetProductsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetProductsUseCase();
    viewModel = ProductsViewModel(mockUseCase);
  });

  test('Deve atualizar o estado para sucesso quando o UseCase retornar dados', () async {
    when(() => mockUseCase.execute()).thenAnswer((_) async => const Success([]));

    final future = viewModel.fetchProducts();

    expect(viewModel.isLoading, isTrue);

    await future;

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.errorMessage, isNull);
  });

  test('Deve capturar erro quando o UseCase falhar', () async {
    when(() => mockUseCase.execute()).thenAnswer(
      (_) async => Failure(Exception('Erro na API')),
    );

    await viewModel.fetchProducts();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.errorMessage, contains('Erro na API'));
  });
}