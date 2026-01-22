import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopping_cart/core/config/shopping_app.dart';

void main() async {
  await dotenv.load();
  runApp(const ShoppingApp());
}