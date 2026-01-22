import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/config/shopping_app_text_styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;

  const TextWidget({super.key, required this.style , required this.text, this.textAlign, this.color , this.overflow});
  
  TextWidget.bold({
    super.key,
    TextStyle? textStyle ,
    required this.text, 
    this.textAlign, 
    this.color , 
    this.overflow}) : style = textStyle ?? ShoppingAppTextStyles.getNormalBoldStyle;

    TextWidget.title({
    super.key,
    TextStyle? textStyle ,
    required this.text, 
    this.textAlign, 
    this.color , 
    this.overflow}) : style = textStyle ?? ShoppingAppTextStyles.getTitleStyle;

    TextWidget.normal({
    super.key,
    TextStyle? textStyle ,
    required this.text, 
    this.textAlign, 
    this.color , 
    this.overflow}) : style = textStyle ?? ShoppingAppTextStyles.getNormalStyle;

    TextWidget.small({
    super.key,
    TextStyle? textStyle ,
    required this.text, 
    this.textAlign, 
    this.color , 
    this.overflow}) : style = textStyle ?? ShoppingAppTextStyles.getSmallStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color ?? ShoppingAppColors.whiteColor
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}