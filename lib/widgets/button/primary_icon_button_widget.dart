import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconButtonWidget extends StatelessWidget {
  const PrimaryIconButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.iconData,
      this.borderRadius = 8,
      this.padding,
      this.buttonColor});

  final String title;
  final double borderRadius;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final Color? buttonColor;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.accentThin,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        child: Row(
          children: [
            Icon(iconData ?? Icons.circle_outlined,
                color: AppColors.blue, size: 30),
            SizedBox(width: 8.w),
            PrimaryNormalTextWidget(
                title: title,
                normalTextType: NormalTextType.normal16,
                color: AppColors.text)
          ],
        ));
  }
}
