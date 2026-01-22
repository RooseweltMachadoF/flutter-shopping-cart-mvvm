import 'package:flutter/material.dart';
import 'package:shopping_cart/core/enums/size_enum.dart';
import 'package:shopping_cart/core/extensions/ui/sizes_extension.dart';

class StarRatingWidget extends StatelessWidget {
  final int rating;

  const StarRatingWidget({super.key, required this.rating})
    : assert(rating <= 5 && rating % 1 == 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizesEnum.xxxs.getSize),
          child: Icon(
            Icons.star,
            color: index >= rating ? Colors.white : Colors.yellow,
            size: SizesEnum.lg.getSize,
          ),
        );
      }),
    );
  }
}
