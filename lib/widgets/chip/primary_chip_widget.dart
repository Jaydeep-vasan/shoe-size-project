import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryChipWidget extends StatelessWidget {
  const PrimaryChipWidget(
      {required this.title,
        required this.isSelected,
        required this.onTap,
        super.key});

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isSelected ? AppColors.primary : AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.gray, blurRadius: 5, spreadRadius: 1)
              ],
            ),
            child: Text(title,
                style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.darkText,
                    fontSize: 15.sp))));
  }
}
