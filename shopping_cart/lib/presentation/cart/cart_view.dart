import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';
  const CartView({super.key});
  
  @override
  Widget build(BuildContext context) {
     return Center(child: Text("Cart"),);
  }
}