import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTableHeaderWidget extends StatelessWidget {
  const PrimaryTableHeaderWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: PrimarySemiBoldTextWidget(
            title: title,
            semiBoldTextType: SemiBoldTextType.semiBold16,
            color: AppColors.white));
  }
}
