import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/products/commands/loading_products_commad.dart';
import 'package:shopping_cart/presentation/products/viewModel/products_view_model.dart';
import 'package:shopping_cart/presentation/products/widgets/products_widget.dart';
import 'package:shopping_cart/core/widgets/error_button/error_with_button_widget.dart';

class MockProductsViewModel extends Mock implements ProductsViewModel {}
class MockLoadProductsCommand extends Mock implements LoadProductsCommand {}

void main() {
  late MockProductsViewModel mockVM;
  late MockLoadProductsCommand mockCommand;

  setUp(() {
    mockVM = MockProductsViewModel();
    mockCommand = MockLoadProductsCommand();

    when(() => mockVM.fetchProducts()).thenAnswer((_) async {});
    
    when(() => mockVM.loadProductsCommand).thenReturn(mockCommand);
    
    when(() => mockVM.products).thenReturn([]);
    when(() => mockCommand.isLoading).thenReturn(false);
    when(() => mockCommand.error).thenReturn(null);
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChangeNotifierProvider<ProductsViewModel>.value(
        value: mockVM,
        child: const ProductsWidget(),
      ),
    );
  }

  testWidgets('Deve exibir loading quando o comando estiver carregando', (tester) async {
    when(() => mockCommand.isLoading).thenReturn(true);

    await tester.pumpWidget(createWidgetUnderTest());
    
    await tester.pump(); 

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Deve exibir widget de erro quando o comando falhar', (tester) async {
    when(() => mockCommand.error).thenReturn("Erro de conexão");

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); 

    expect(find.byType(ErrorWithButtonWidget), findsOneWidget);
    expect(find.text("Erro de conexão"), findsOneWidget);
  });
}