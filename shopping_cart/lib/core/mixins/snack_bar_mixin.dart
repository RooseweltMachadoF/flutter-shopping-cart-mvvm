import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/widgets/texts/text_widget.dart';

enum MessageType {sucess , error}

mixin SnackBarMixin {
  void showSnackBar(BuildContext context, String message, MessageType messageType){
    ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: TextWidget.normal(text: message),
        backgroundColor: 
          messageType == MessageType.error ? ShoppingAppColors.errorColor : ShoppingAppColors.successGreen,));
  }
}