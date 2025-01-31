import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryAssetIconButtonWidget extends StatelessWidget {
  const PrimaryAssetIconButtonWidget(
      {super.key,
      required this.title,
      required this.imgPath,
      this.borderRadius = 32,
      this.padding,
      this.height,
      this.width,
      this.textColor,
      this.buttonColor});

  final String title;
  final String imgPath;
  final double borderRadius;
  final EdgeInsets? padding;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor ?? AppColors.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(imgPath, height: height, width: width, fit: BoxFit.cover),
          SizedBox(width: 4.w),
          PrimaryBoldTextWidget(
              title: title,
              boldTextType: BoldTextType.bold12,
              color: textColor ?? AppColors.white)
        ],
      ),
    );
  }
}
