import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/nav/viewModel/nav_view_model.dart';

ChangeNotifierProvider<NavViewModel> makeNavController(BuildContext context) =>
    ChangeNotifierProvider<NavViewModel>(
      create: (context) => NavViewModel(),
    );