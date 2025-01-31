import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDotIndicator extends StatelessWidget {
  const PrimaryDotIndicator(
      {super.key,
      this.isActive = false,
      this.activeColor = AppColors.active,
      this.inActiveColor = AppColors.inactive});

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        height: 5.h,
        width: 8.w,
        decoration: BoxDecoration(
            color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
            borderRadius: const BorderRadius.all(Radius.circular(20))));
  }
}
