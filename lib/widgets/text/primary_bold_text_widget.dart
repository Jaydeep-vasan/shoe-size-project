import 'package:shoe_size/utils/app_text_font_styles.dart';
import 'package:shoe_size/widgets/text/primary_default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BoldTextType {
  bold24,
  bold20,
  bold18,
  bold16,
  bold14,
  bold12,
  bold10,
}

class PrimaryBoldTextWidget extends StatelessWidget {
  const PrimaryBoldTextWidget(
      {super.key,
      required this.title,
      required this.boldTextType,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.height,
      this.maxLines,
      this.overflow,
      this.textAlign = TextAlign.start});
  final String title;
  final BoldTextType boldTextType;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  TextStyle? _getStyle(BoldTextType variant) {
    switch (variant) {
      case BoldTextType.bold24:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 24.sp, height: 1.45);
      case BoldTextType.bold20:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 20.sp, height: 1.33);
      case BoldTextType.bold18:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 18.sp, height: 1.25);
      case BoldTextType.bold16:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 16.sp, height: 1.25);
      case BoldTextType.bold14:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 14.sp, height: 1.5);
      case BoldTextType.bold12:
        return AppTextFontStyles.black12Bold;
      case BoldTextType.bold10:
        return AppTextFontStyles.black12Bold?.copyWith(fontSize: 10.sp, height: 1.25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryDefaultTextWidget(
        title: title,
        textAlign: textAlign,
        textStyle: _getStyle(boldTextType),
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        overflow: overflow,
        maxLines: maxLines);
  }
}
