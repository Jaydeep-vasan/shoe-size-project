import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryRichTextWithGesturesWidget extends StatelessWidget {
  const PrimaryRichTextWithGesturesWidget(
      {required this.title,
        required this.subTitle,
        required this.caption,
        required this.onTap,
        super.key});

  final String title;
  final String subTitle;
  final String caption;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: AppColors.error,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500)),
          WidgetSpan(child: SizedBox(width: 2.w)),
          TextSpan(
              text: subTitle,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.error,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = onTap),
          WidgetSpan(child: SizedBox(width: 2.w)),
          TextSpan(
              text: caption,
              style: TextStyle(
                  color: AppColors.error,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
