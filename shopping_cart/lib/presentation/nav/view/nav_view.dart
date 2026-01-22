import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/nav/factory/nav_viewModel_factory.dart';
import 'package:shopping_cart/presentation/nav/widgets/nav_widget.dart';

class NavView extends StatelessWidget {
  static const String routeName = '/nav';

  const NavView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        makeNavController(context),
      ],
      child: const NavWidget(),
    );
  }
}