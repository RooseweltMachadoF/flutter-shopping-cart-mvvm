import 'package:flutter/material.dart';

class NetworkAppImageWidget extends StatelessWidget {
  final String logoImage;
  final double? height;
  final BoxFit? boxFit;

  const NetworkAppImageWidget({
    super.key,
    required this.logoImage,
    this.height,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      logoImage,
      height: height,
      fit: boxFit,
    );
  }
}
