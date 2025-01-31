import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOutlineButtonWidget extends StatelessWidget {
  const PrimaryOutlineButtonWidget(
      {super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: AppColors.darkText),
                borderRadius: BorderRadius.circular(32)),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        child: PrimaryNormalTextWidget(
            title: title,
            normalTextType: NormalTextType.normal14,
            color: AppColors.darkText));
  }
}
