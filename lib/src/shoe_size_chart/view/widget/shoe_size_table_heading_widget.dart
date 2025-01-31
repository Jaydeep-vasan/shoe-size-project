import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class ShoeSizeTableHeadingWidget extends StatelessWidget {
  const ShoeSizeTableHeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.black),
            color: AppColors.blue),
        child: IntrinsicHeight(
            child: Row(children: [
          Expanded(
              child: PrimaryBoldTextWidget(
                      title: AppStrings.strUS.tr,
                      boldTextType: BoldTextType.bold16,
                      color: AppColors.white)
                  .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
          VerticalDivider(width: 1.w, color: AppColors.black),
          Expanded(
              child: PrimaryBoldTextWidget(
                      title: AppStrings.strUK.tr,
                      boldTextType: BoldTextType.bold16,
                      color: AppColors.white)
                  .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
          VerticalDivider(width: 1.w, color: AppColors.black),
          Expanded(
              child: PrimaryBoldTextWidget(
                      title: AppStrings.strEU.tr,
                      boldTextType: BoldTextType.bold16,
                      color: AppColors.white)
                  .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
          VerticalDivider(width: 1.w, color: AppColors.black),
          Expanded(
              child: PrimaryBoldTextWidget(
                      title: AppStrings.strCM.tr,
                      boldTextType: BoldTextType.bold16,
                      color: AppColors.white)
                  .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
          VerticalDivider(width: 1.w, color: AppColors.black),
          Expanded(
              child: PrimaryBoldTextWidget(
                      title: AppStrings.strINCH.tr,
                      boldTextType: BoldTextType.bold16,
                      color: AppColors.white)
                  .paddingSymmetric(horizontal: 4.w, vertical: 8.h))
        ])));
  }
}
