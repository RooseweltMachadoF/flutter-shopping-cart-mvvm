import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/mixins/navigator_mixin.dart';
import 'package:shopping_cart/core/mixins/snack_bar_mixin.dart';
import 'package:shopping_cart/core/widgets/buttons/button_widget.dart';
import 'package:shopping_cart/presentation/cart/viewModel/cart_view_model.dart';
import 'package:shopping_cart/presentation/cart/widgets/cart_item_card_widget.dart';
import 'package:shopping_cart/presentation/order/order_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with SnackBarMixin, NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cartVM, child) {
        if (cartVM.products.isEmpty) {
          return const Center(child: Text('Sua sacola está vazia 🛒'));
        }

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartVM.products.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = cartVM.products[index];
                    final quantity = cartVM.getProductQuantity(product.id);

                    final isRemoving = cartVM.isItemLoading(product.id);

                    return CartItemCard(
                      onRemove: () => cartVM.removeFromCart(product.id),
                      isRemoving: isRemoving,
                      onDelete: () async{
                        try {
                          await cartVM.removeItemWithSimulatedError(context, product.id);
                        } catch (e) {
                          showSnackBar(context, e.toString(), MessageType.error);
                        }
                      },
                      product: product,
                      quantity: quantity,
                      onAdd: () => cartVM.addToCart(product),
                    
                    );
                  }
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('R\$ ${cartVM.totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ShoppingAppColors.successGreen)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(
                      label: 'FINALIZAR COMPRA',
                      isLoading: cartVM.isCheckingOut,
                      onPressed: ()async {
                        final success = await cartVM.checkout();
                        if (success && context.mounted) {
                          handleNavigation(context, OrderView.routeName);
                        }
                      }, )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}