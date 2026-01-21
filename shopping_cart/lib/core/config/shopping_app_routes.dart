import 'package:flutter/widgets.dart';
import 'package:shopping_cart/presentation/splash/splash_screen_view.dart';

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
    };
  }
}