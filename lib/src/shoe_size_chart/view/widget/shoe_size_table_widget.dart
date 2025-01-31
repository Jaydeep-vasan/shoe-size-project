import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';

class ShoeSizeTableWidget extends StatelessWidget {
  const ShoeSizeTableWidget(
      {super.key,
        required this.uk,
        required this.eu,
        required this.cm,
        required this.itemColor,
        required this.us, required this.inch});

  final double us;
  final double uk;
  final double eu;
  final double cm;
  final double inch;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.black),
            color: itemColor),
        child: IntrinsicHeight(
            child: Row(children: [
              Expanded(
                  child: PrimarySemiBoldTextWidget(
                      title: us.toString(),
                      semiBoldTextType: SemiBoldTextType.semiBold14,
                      color: AppColors.black)
                      .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
              VerticalDivider(width: 1.w, color: AppColors.black),
              Expanded(
                  child: PrimarySemiBoldTextWidget(
                      title: uk.toString(),
                      semiBoldTextType: SemiBoldTextType.semiBold14,
                      color: AppColors.black)
                      .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
              VerticalDivider(width: 1.w, color: AppColors.black),
              Expanded(
                  child: PrimarySemiBoldTextWidget(
                      title: eu.toString(),
                      semiBoldTextType: SemiBoldTextType.semiBold14,
                      color: AppColors.black)
                      .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
              VerticalDivider(width: 1.w, color: AppColors.black),
              Expanded(
                  child: PrimarySemiBoldTextWidget(
                      title: cm.toString(),
                      semiBoldTextType: SemiBoldTextType.semiBold14,
                      color: AppColors.black)
                      .paddingSymmetric(horizontal: 4.w, vertical: 8.h)),
              VerticalDivider(width: 1.w, color: AppColors.black),
              Expanded(
                  child: PrimarySemiBoldTextWidget(
                      title: inch.toString(),
                      semiBoldTextType: SemiBoldTextType.semiBold14,
                      color: AppColors.black)
                      .paddingSymmetric(horizontal: 4.w, vertical: 8.h))
            ])));
  }
}
