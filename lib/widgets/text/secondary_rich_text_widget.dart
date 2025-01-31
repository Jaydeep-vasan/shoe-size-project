import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryRichTextWidget extends StatelessWidget {
  const SecondaryRichTextWidget(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 14.sp,
                  height: 1.5,
                  fontWeight: FontWeight.bold)),
          WidgetSpan(child: SizedBox(width: title.isEmpty ? 0.w: 4.w)),
          TextSpan(
              text: subTitle,
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
