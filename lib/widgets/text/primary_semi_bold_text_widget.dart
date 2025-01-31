import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_text_font_styles.dart';
import 'package:shoe_size/widgets/text/primary_default_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SemiBoldTextType {
  semiBold20,
  semiBold16,
  semiBold14,
  semiBold12,
  semiBold10,
}

class PrimarySemiBoldTextWidget extends StatelessWidget {
  const PrimarySemiBoldTextWidget(
      {super.key,
      required this.title,
      required this.semiBoldTextType,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.height,
      this.maxLines,
      this.overflow,
      this.textAlign});
  final String title;
  final SemiBoldTextType semiBoldTextType;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  TextStyle? _getStyle(SemiBoldTextType variant) {
    switch (variant) {
      case SemiBoldTextType.semiBold20:
        return AppTextFontStyles.black12SemiBold?.copyWith(fontSize: 20.sp, height: 1.25);
      case SemiBoldTextType.semiBold16:
        return AppTextFontStyles.black12SemiBold?.copyWith(fontSize: 16.sp, height: 1.25);
      case SemiBoldTextType.semiBold14:
        return AppTextFontStyles.black12SemiBold?.copyWith(fontSize: 14.sp, height: 1.45);
      case SemiBoldTextType.semiBold12:
        return AppTextFontStyles.black12SemiBold;
      case SemiBoldTextType.semiBold10:
        return AppTextFontStyles.black12SemiBold?.copyWith(fontSize: 10.sp, height: 1.4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryDefaultTextWidget(
        title: title,
        textStyle: _getStyle(semiBoldTextType),
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign);
  }
}
