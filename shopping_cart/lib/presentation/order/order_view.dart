import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/config/shopping_app_collors.dart';
import 'package:shopping_cart/core/enums/size_enum.dart';
import 'package:shopping_cart/core/extensions/ui/sizes_extension.dart';
import 'package:shopping_cart/core/mixins/navigator_mixin.dart';
import 'package:shopping_cart/core/widgets/buttons/button_widget.dart';
import 'package:shopping_cart/core/widgets/images/network_app_image_widget.dart';
import 'package:shopping_cart/core/widgets/texts/text_widget.dart';
import 'package:shopping_cart/presentation/nav/view/nav_view.dart';
import 'package:shopping_cart/presentation/order/order_view_model.dart';

class OrderView extends StatefulWidget {
  static const String routeName = '/order';
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(
      builder: (context, orderVM, child) {
        if (orderVM.lastOrderItems.isEmpty) {
          return const Center(child: Text("Nenhum pedido realizado ainda."));
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Pedido Finalizado"), leading: Icon(Icons.chevron_left , size: SizesEnum.xl.getSize, color: Colors.white,),),
          backgroundColor: ShoppingAppColors.backgroundColor,
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                  height: 1, 
                  thickness: 0.8, 
                    color: Colors.grey,
                    ),
                  itemCount: orderVM.lastOrderItems.length,
                  itemBuilder: (context, index) {
                    final item = orderVM.lastOrderItems[index];
                    return ListTile(
                      leading: SizedBox(height: 90, width: 90, child: NetworkAppImageWidget(logoImage: item.image),),
                      title: Text(item.title),
                      subtitle: Text("Unidade: R\$ ${item.price}"),
                      trailing: Text("R\$ ${item.price}"),
                    );
                  },
                ),
              ),
              
              
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey[100],
                child: Column(
                  children: [
                    _buildRow("Subtotal", orderVM.subtotal),
                    _buildRow("Frete (Simulado)", orderVM.freight),
                    const Divider(),
                    _buildRow("Total", orderVM.total, isTotal: true),
                    const SizedBox(height: 20),
                    
                    ButtonWidget(
                      label: "NOVO PEDIDO",
                      isBlock: true,
                      onPressed: () {
                        handleNavigation(context, NavView.routeName , clear: true);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget.bold(text: label , textStyle: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal), color: Colors.black,),
        TextWidget.bold(text: "R\$ ${value.toStringAsFixed(2)}", color: Colors.black,),
      ],
    );
  }
}