import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';

class ButtonQuantitySelectorWidget extends StatelessWidget {
  final ProductEntity model;
  final void Function()? removeFromCart;
  final void Function()? addToCart;
  final int quantity;
  const ButtonQuantitySelectorWidget({super.key , required this.model ,required this.addToCart ,required this.removeFromCart, required this.quantity});
  
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: ShoppingAppColors.primaryColor.withOpacity(0.3)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: removeFromCart,
          icon: Icon(Icons.remove, color: ShoppingAppColors.errorColor, size: 18),
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        IconButton(
          onPressed: addToCart,
          icon: Icon(Icons.add, color: ShoppingAppColors.successGreen, size: 18),
        ),
      ],
    ),
  );
  }
}