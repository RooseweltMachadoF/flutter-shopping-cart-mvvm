import 'package:flutter/widgets.dart';
import 'package:shopping_cart/presentation/cart/cart_view.dart';
import 'package:shopping_cart/presentation/nav/view/nav_view.dart';
import 'package:shopping_cart/presentation/splash/view/splash_view.dart';

class ShoppingAppRoutes {
  static final ShoppingAppRoutes _singleton = ShoppingAppRoutes._internal();

  factory ShoppingAppRoutes() {
    return _singleton;
  }
  
  ShoppingAppRoutes._internal();

  static Map<String, Widget Function(BuildContext)> getRoutes(){
    return {
      SplashScreenView.routeName : (_) {
        return const SplashScreenView();
      },

      NavView.routeName : (_) {
        return const NavView();
      },

      CartView.routeName : (_) {
        return const CartView();
      },
      
    };
  }
}