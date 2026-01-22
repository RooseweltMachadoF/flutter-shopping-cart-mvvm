import 'package:flutter/material.dart';
import 'package:shopping_cart/core/mixins/navigator_mixin.dart';
import 'package:shopping_cart/core/service/dot_env_services.dart';
import 'package:shopping_cart/core/widgets/images/network_app_image_widget.dart';
import 'package:shopping_cart/core/widgets/sized_box/sized_box_widget.dart';
import 'package:shopping_cart/core/widgets/texts/text_widget.dart';
import 'package:shopping_cart/presentation/nav/view/nav_view.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});
  
  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}
class _SplashScreenWidgetState extends State<SplashScreenWidget> with NavigatorMixin {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      
      await Future.delayed(const Duration(seconds: 2));
      handleNavigation(context, NavView.routeName, clear: true);
    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: NetworkAppImageWidget(logoImage: DotEnvServices.getApiImagesBaseUrl),
          ),
        ),
        SizedBoxWidget.md(),
        TextWidget.title(text: 'Loading ...'),
      ],
    );
  }
}