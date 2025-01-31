import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryVerticalDetailTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const PrimaryVerticalDetailTileWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: value.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryMediumTextWidget(
                title: title,
                mediumTextType: MediumTextType.medium14,
                color: AppColors.gray),
            SizedBox(height: 2.h),
            PrimaryBoldTextWidget(
                title: value,
                boldTextType: BoldTextType.bold16,
                color: AppColors.primaryDark)
          ],
        ).marginOnly(bottom: 8.h));
  }
}
