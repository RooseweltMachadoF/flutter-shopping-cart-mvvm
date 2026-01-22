import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/mixins/navigator_mixin.dart';
import 'package:shopping_cart/core/service/dot_env_services.dart';
import 'package:shopping_cart/core/widgets/images/network_app_image_widget.dart';
import 'package:shopping_cart/presentation/cart/view/cart_view.dart';
import 'package:shopping_cart/presentation/cart/viewModel/cart_view_model.dart';
import 'package:shopping_cart/presentation/nav/viewModel/nav_view_model.dart';
import 'package:shopping_cart/presentation/products/view/products_view.dart';

class NavWidget extends StatefulWidget {
  

  const NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Consumer<NavViewModel>(
      builder: (context, navVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ShoppingAppColors.primaryColor,
            title: SizedBox(
              height: 50,
              width: 100,
              child: NetworkAppImageWidget(logoImage: DotEnvServices.getApiImagesBaseUrl,)),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  navVM.selectNavIndex(1);
                },
                child: _buildCartBadge(context )),
            ],
          ),
          backgroundColor: ShoppingAppColors.backgroundColor,
          body: IndexedStack( 
            index: navVM.navIndex,
            children: const [
              ProductsView(),
              CartView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ShoppingAppColors.primaryColor,
            currentIndex: navVM.navIndex,
            onTap: navVM.selectNavIndex,
            selectedItemColor: ShoppingAppColors.secondaryColor, 
            unselectedItemColor: ShoppingAppColors.whiteColor, 
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.storefront),
                label: 'Produtos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Carrinho',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartBadge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          Positioned(
            right: 0,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: ShoppingAppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(minWidth: 13, minHeight: 13),
              child: Consumer<CartViewModel>(builder: (context, controller, child){
                return 
                 Text(
                controller.products.length.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              );
              }),
              
            ),
          ),
        ],
      ),
    );
  }
}