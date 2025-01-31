import 'package:shoe_size/utils/app_text_font_styles.dart';
import 'package:shoe_size/widgets/text/primary_default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum NormalTextType {
  normal20,
  normal18,
  normal16,
  normal14,
  normal12,
  normal11,
  normal10,
  normal8,
}

class PrimaryNormalTextWidget extends StatelessWidget {
  const PrimaryNormalTextWidget(
      {super.key,
      required this.title,
      required this.normalTextType,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.height,
      this.textDirection,
      this.textAlign,
      this.shadows,
      this.decorationColor,
      this.overflow,
      this.maxLines});
  final String title;
  final NormalTextType normalTextType;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final int? maxLines;
  final List<Shadow>? shadows;
  final TextOverflow? overflow;

  TextStyle? _getStyle(NormalTextType variant) {
    switch (variant) {
      case NormalTextType.normal20:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 20.sp, height: 1.25);
      case NormalTextType.normal18:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 18.sp, height: 1.25);
      case NormalTextType.normal16:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 16.sp, height: 1.25);
      case NormalTextType.normal14:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 14.sp, height: 1.55);
      case NormalTextType.normal12:
        return AppTextFontStyles.black12Normal;
      case NormalTextType.normal11:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 11.sp, height: 1.3);
      case NormalTextType.normal10:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 10.sp, height: 1.4);
      case NormalTextType.normal8:
        return AppTextFontStyles.black12Normal
            ?.copyWith(fontSize: 8.sp, height: 1.2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryDefaultTextWidget(
        title: title,
        textStyle: _getStyle(normalTextType),
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        textDirection: textDirection,
        textAlign: textAlign,
        shadows: shadows,
        decorationColor: decorationColor,
        overflow: overflow,
        maxLines: maxLines);
  }
}
