import 'package:flutter/cupertino.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';

class PrimaryHorizontalDetailTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const PrimaryHorizontalDetailTileWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: value.isNotEmpty,
        child: Row(
          children: [
            PrimarySemiBoldTextWidget(
                title: title,
                semiBoldTextType: SemiBoldTextType.semiBold12,
                color: AppColors.gray),
            SizedBox(height: 4.h),
            Expanded(
                child: PrimaryBoldTextWidget(
                    title: value,
                    boldTextType: BoldTextType.bold14,
                    color: AppColors.primaryDark))
          ],
        ).marginOnly(bottom: 8.h));
  }
}
