import 'package:flutter/material.dart';

class ShoppingAppColors {
  static final ShoppingAppColors _instance = ShoppingAppColors._internal();

  factory ShoppingAppColors() {
    return _instance;
  }

  ShoppingAppColors._internal();

  static Color get primaryColor => const Color(0xFFFF6600);

  static Color get secondaryColor => const Color(0xFF003399); 

  static Color get backgroundColor => const Color(0xFFF5F5F5);
  static Color get greyColor => const Color(0xFF757575);

  static Color get errorColor => const Color(0xFFDC3545);  
  static Color get favoriteColor => Colors.redAccent;

  static Color get successColor => const Color(0xFF28A745);

  static Color get whiteColor => Colors.white;
}