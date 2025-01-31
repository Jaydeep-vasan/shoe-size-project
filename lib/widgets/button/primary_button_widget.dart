import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.fontWeight,
      this.fontSize,
      this.borderRadius = 4,
      this.padding,
      this.buttonColor,
      this.textColor});

  final String title;
  final double borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: buttonColor ?? AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            padding: padding ?? EdgeInsets.symmetric(vertical: 16.h)),
        child: PrimaryNormalTextWidget(
            title: title,
            fontSize: fontSize,
            fontWeight: fontWeight,
            normalTextType: NormalTextType.normal14,
            color: textColor ?? AppColors.white));
  }
}
