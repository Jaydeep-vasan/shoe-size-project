import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTitleWithDividerWidget extends StatelessWidget {
  const PrimaryTitleWithDividerWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryBoldTextWidget(
            title: title,
            boldTextType: BoldTextType.bold24,
            color: AppColors.darkText),
        Container(
            padding: EdgeInsets.only(top: 4.h),
            width: 40.w,
            child: const Divider(thickness: 5, color: AppColors.error))
      ],
    );
  }
}
