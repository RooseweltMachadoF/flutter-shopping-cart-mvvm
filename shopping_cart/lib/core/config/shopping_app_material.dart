import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';

class ShoppingAppMaterial {
  static final ShoppingAppMaterial _singleton = ShoppingAppMaterial._internal();

  factory ShoppingAppMaterial() {
    return _singleton;
  }
  
  ShoppingAppMaterial._internal();

  static const String title= 'Tenda App';

  static const Locale locale = Locale("pt_BR");
  
  static ThemeData get getThemeData => ThemeData(
    scaffoldBackgroundColor: ShoppingAppColors.primaryColor,
    primaryColor: ShoppingAppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ShoppingAppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: ShoppingAppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      centerTitle: true,
      elevation: 0,
    ),
    fontFamily: 'Lato',

  );
}