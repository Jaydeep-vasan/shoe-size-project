import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class PrimarySettingTileWidget extends StatelessWidget {
  const PrimarySettingTileWidget(
      {required this.title,
      required this.imgPath,
      required this.onTap,
      super.key});

  final String title;
  final String imgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 5,
                      spreadRadius: 0.5)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(imgPath,
                      height: 40.h, width: 40.h, fit: BoxFit.cover),
                  SizedBox(width: 16.w),
                  Expanded(
                      child: PrimaryBoldTextWidget(
                          title: title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          boldTextType: BoldTextType.bold16,
                          color: AppColors.primaryDark))
                ])));
  }
}
