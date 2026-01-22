import 'package:flutter/material.dart';

class ShoppingAppColors {
  static final ShoppingAppColors _instance = ShoppingAppColors._internal();

  factory ShoppingAppColors() {
    return _instance;
  }

  ShoppingAppColors._internal();

  // Azul mais escuro do topo (Header Institucional)
  static Color get primaryDarkBlue => const Color(0xFF003366);

  // Azul vibrante da barra de busca (Identidade Principal)
  static Color get primaryColor => const Color(0xFF0054A6);

  // Vermelho do Logo e Destaques (Botões de Urgência)
  static Color get secondaryColor => const Color(0xFFE30613); 

  // Verde do botão de checkout e carrinho (Ação Positiva)
  static Color get successGreen => const Color(0xFF4CAF50);

  // Amarelo dos selos de "Dicas" e Ofertas
  static Color get highlightYellow => const Color(0xFFFFD400);

  static Color get errorColor => const Color(0xFFD32F2F);

  // Background e Neutros
  static Color get backgroundColor => const Color(0xFFF2F2F2);
  static Color get whiteColor => Colors.white;
  static Color get greyText => const Color(0xFF666666);
}