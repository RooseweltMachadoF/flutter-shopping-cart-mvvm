import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  static const String routeName = '/order';
  const OrderView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Orders"),);
  }
}