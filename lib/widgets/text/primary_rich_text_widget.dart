import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryRichTextWidget extends StatelessWidget {
  const PrimaryRichTextWidget(
      {required this.title,
      required this.subTitle,
      required this.onTap,
      super.key});

  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)),
          WidgetSpan(child: SizedBox(width: title.isEmpty ? 0.w : 4.w)),
          TextSpan(
              text: subTitle,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.hyperlink,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    );
  }
}
