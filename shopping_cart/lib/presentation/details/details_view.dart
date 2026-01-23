import 'package:flutter/material.dart';
import 'package:shopping_cart/core/enums/size_enum.dart';
import 'package:shopping_cart/core/extensions/ui/media_query_extension.dart';
import 'package:shopping_cart/core/extensions/ui/sizes_extension.dart';
import 'package:shopping_cart/core/widgets/images/network_app_image_widget.dart';
import 'package:shopping_cart/core/widgets/sized_box/sized_box_widget.dart';
import 'package:shopping_cart/core/widgets/star_rating/star_rating_widget.dart';
import 'package:shopping_cart/core/widgets/texts/text_widget.dart';
import 'package:shopping_cart/domain/entities/product/product_entity.dart';

class DetailsView extends StatelessWidget {
  static const String routeName = '/product-details';
  const DetailsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.chevron_left), iconSize: SizesEnum.xl.getSize,),
                flexibleSpace: Hero(
                  tag: "product-${item.id}",
                  child: NetworkAppImageWidget(
                    logoImage: item.image,
                    height: context.getHeight,
                    boxFit: BoxFit.cover,
                  ),
                ),
                collapsedHeight: context.getHeight,
                stretch: true,
              ),
            ],
          ),
          Positioned(
            width: context.getWidth,
            top: context.getHeight / 2.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.9),
                    Colors.black.withValues(alpha: 0.95),
                    Colors.black,
                  ],
                ),
              ),
              height: context.getHeight / 1.5,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(SizesEnum.md.getSize, SizesEnum.md.getSize * 2.5, SizesEnum.md.getSize, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget.title(text: item.title,textAlign: TextAlign.center,),
                    SizedBoxWidget.xs(),
                    TextWidget.small(text: 'R\$ ${item.price}'),
                    SizedBoxWidget.md(),
                    StarRatingWidget(rating: (item.rating.rate / 2).round(),),
                    SizedBoxWidget.lg(),
                    TextWidget.title(text:"Descrição",textAlign: TextAlign.center,),
                    SizedBoxWidget.md(),
                    TextWidget.normal(text: item.description,textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}