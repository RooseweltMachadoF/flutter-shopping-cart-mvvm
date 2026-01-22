import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';
import 'package:shopping_cart/data/repositories/products_repository/products_repository.dart';
import 'package:shopping_cart/presentation/products/viewModel/products_view_model.dart';

ChangeNotifierProvider<ProductsViewModel> makeProductController(BuildContext context) =>
    ChangeNotifierProvider<ProductsViewModel>(
      create: (_) => ProductsViewModel(
        ProductsRepository(
          Provider.of<IApiRepositories>(context),
        ),
      ),
    );