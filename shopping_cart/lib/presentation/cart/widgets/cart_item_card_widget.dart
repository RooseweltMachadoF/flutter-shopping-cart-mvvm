import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/widgets/buttons/button_quantity_selector_widget.dart';
import 'package:shopping_cart/core/widgets/images/network_app_image_widget.dart';
import 'package:shopping_cart/core/widgets/texts/text_widget.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete; // Ação para remover com simulação de erro
  final bool isRemoving; // Para controlar o loading individual

  const CartItemCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
    this.isRemoving = false,
  });

  @override
  Widget build(BuildContext context) {
    final double subtotal = (product.price) * quantity;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: NetworkAppImageWidget(logoImage: product.image),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.title(
                  text: product.title,
                  overflow: TextOverflow.ellipsis,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                TextWidget.small(
                  text: "Quantidade", 
                  color: ShoppingAppColors.greyText,
                ),
                const SizedBox(height: 4),
                
                ButtonQuantitySelectorWidget(
                  model: product,
                  quantity: quantity,
                  addToCart: onAdd,
                  removeFromCart: onRemove,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Valores à Direita
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Unidade: R\$ ${product.price.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
              ),
              const SizedBox(height: 14),
              InkWell(
                      onTap: isRemoving ? null : onDelete,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: isRemoving
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : TextWidget.title(
                                text: "Remover",
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  fontSize: 12,
                                  decoration: TextDecoration.underline, 
                                ),
                                color: ShoppingAppColors.primaryColor,
                              ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}