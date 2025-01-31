import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.borderWidth = 0,
      this.color = AppColors.primary,
      this.textColor = AppColors.white});

  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: borderWidth, color: AppColors.darkText),
                borderRadius: BorderRadius.circular(32)),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h)),
        child: PrimaryNormalTextWidget(
            title: title,
            normalTextType: NormalTextType.normal14,
            color: textColor));
  }
}
