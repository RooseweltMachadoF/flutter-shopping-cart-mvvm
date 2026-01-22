import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/splash/widgets/splash_view_widget.dart';

class SplashScreenView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreenView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const SplashScreenWidget(),
      );
  }
}