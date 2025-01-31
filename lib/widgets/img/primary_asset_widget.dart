import 'package:flutter/material.dart';

class PrimaryAssetWidget extends StatelessWidget {
  const PrimaryAssetWidget(
      {super.key,
      required this.imgPath,
      this.fit,
      this.height,
      this.width,
      this.color});

  final String imgPath;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imgPath,
        fit: fit, height: height, width: width, color: color);
  }
}
