import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/products/factory/products_factory.dart';
import 'package:shopping_cart/presentation/products/widgets/products_widget.dart';

class ProductsView extends StatelessWidget {
  static const String routeName = '/products';

  const ProductsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        makeProductController(),
      ],
      child: const ProductsWidget(),
    );
  }
}