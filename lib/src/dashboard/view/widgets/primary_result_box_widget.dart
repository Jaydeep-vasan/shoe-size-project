import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';

class PrimaryResultBoxWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool? isHeading;
  final Color? color;
  final double? verticalPadding;

  const PrimaryResultBoxWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.color,
      this.verticalPadding,
      this.isHeading});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color ?? AppColors.white,
            boxShadow: const [
              BoxShadow(
                  color: AppColors.boxShadow, blurRadius: 5, spreadRadius: 1),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryBoldTextWidget(
              title: title,
              boldTextType: isHeading == true
                  ? BoldTextType.bold20
                  : BoldTextType.bold14),
          Visibility(
              visible: subTitle.isNotEmpty,
              child: PrimaryMediumTextWidget(
                      title: subTitle, mediumTextType: MediumTextType.medium12)
                  .marginOnly(top: 2.h))
        ]).paddingSymmetric(vertical: verticalPadding ?? 8.h));
  }
}
