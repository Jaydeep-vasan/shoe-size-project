import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_text_font_styles.dart';
import 'package:shoe_size/widgets/text/primary_default_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum MediumTextType {
  medium20,
  medium18,
  medium16,
  medium14,
  medium12,
  medium10,
}

class PrimaryMediumTextWidget extends StatelessWidget {
  const PrimaryMediumTextWidget({
    super.key,
    required this.title,
    required this.mediumTextType,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  final String title;
  final MediumTextType mediumTextType;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  TextStyle? _getStyle(MediumTextType variant) {
    switch (variant) {
      case MediumTextType.medium20:
        return AppTextFontStyles.black12Medium?.copyWith(fontSize: 20.sp, height: 1.4);
      case MediumTextType.medium18:
        return AppTextFontStyles.black12Medium?.copyWith(fontSize: 18.sp, height: 1.3);
      case MediumTextType.medium16:
        return AppTextFontStyles.black12Medium?.copyWith(fontSize: 16.sp, height: 1.25);
      case MediumTextType.medium14:
        return AppTextFontStyles.black12Medium?.copyWith(fontSize: 14.sp, height: 1.55);
      case MediumTextType.medium12:
        return AppTextFontStyles.black12Medium;
      case MediumTextType.medium10:
        return AppTextFontStyles.black12Medium?.copyWith(fontSize: 10.sp, height: 1.4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryDefaultTextWidget(
        title: title,
        textStyle: _getStyle(mediumTextType),
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines);
  }
}
