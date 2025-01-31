import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconWidget extends StatelessWidget {
  const PrimaryIconWidget(
      {required this.toolTip,
      required this.buttonColor,
      required this.onTap,
      required this.icon,
      super.key});

  final String toolTip;
  final IconData icon;
  final Color buttonColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Tooltip(
            message: toolTip,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 5,
                      spreadRadius: 1),
                  BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 5,
                      spreadRadius: 1),
                ], color: buttonColor, borderRadius: BorderRadius.circular(4)),
                child: Icon(icon, size: 24.h, color: AppColors.white))));
  }
}
