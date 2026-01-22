import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/config/initial_bindings.dart';
import 'package:shopping_cart/core/config/shopping_app_material.dart';
import 'package:shopping_cart/core/config/shopping_app_routes.dart';
import 'package:shopping_cart/presentation/cart/cart_view_model.dart';
import 'package:shopping_cart/presentation/splash/view/splash_view.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...InitialBindings.dependecies(),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        title: ShoppingAppMaterial.title,
        theme: ShoppingAppMaterial.getThemeData,
        initialRoute: SplashScreenView.routeName,
        routes: ShoppingAppRoutes.getRoutes(),
        debugShowCheckedModeBanner: false,
      ),
      );
  }
}