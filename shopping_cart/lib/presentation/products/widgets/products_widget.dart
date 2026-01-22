import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/widgets/error_button/error_with_button_widget.dart';
import 'package:shopping_cart/core/widgets/inputs/text_form_field_widgets.dart';
import 'package:shopping_cart/data/models/product/product_model.dart';
import 'package:shopping_cart/presentation/cart/cart_view_model.dart';
import 'package:shopping_cart/presentation/products/viewModel/products_view_model.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       context.read<ProductsViewModel>().fetchProducts(); 
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShoppingAppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: ShoppingAppColors.primaryColor, 
            child: TextFormFieldWidgets(
              controller: _searchController,
              focusNode: _searchFocus,
              hintText: "Pesquise aqui",
              prefixIcon: Icons.search,
            ),
          ),

          Expanded(
            child: Consumer<ProductsViewModel>(
              builder: (context, vm, child) {
                if (vm.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (vm.hasError) {
                  return Center(
                    child: ErrorWithButtonWidget(errorMessage: "Erro ao carregar a tela", tryAgain: vm.fetchProducts),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75, 
                  ),
                  itemCount: vm.products.length,
                  itemBuilder: (context, index) {
                    final product = vm.products[index];
                    return _buildProductCard(product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(product.image, fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: ShoppingAppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: ShoppingAppColors.successGreen, 
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Consumer<CartViewModel>(builder: (context, controller, child){
                final quantity = controller.getProductQuantity(product.id);
                if(quantity == 0){
                  return IconButton(
                onPressed: (){
                  controller.addToCart(product);
                },
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
              );
                }
                else{
                  return _buildQuantitySelector(context, product, quantity);
                }
                
              }),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildQuantitySelector(BuildContext context, ProductModel product, int quantity) {
  final cartVM = context.read<CartViewModel>();

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
          onPressed: () => cartVM.removeFromCart(product.id),
          icon: Icon(Icons.remove, color: ShoppingAppColors.errorColor, size: 18),
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        IconButton(
          onPressed: () => cartVM.addToCart(product),
          icon: Icon(Icons.add, color: ShoppingAppColors.successGreen, size: 18),
        ),
      ],
    ),
  );
}
}