import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryRichTextWithCaptionSubCaptionWidget extends StatelessWidget {
  const SecondaryRichTextWithCaptionSubCaptionWidget(
      {required this.title, required this.subTitle, required this.caption, required this.subCaption, super.key});

  final String title;
  final String subTitle;
  final String caption;
  final String subCaption;

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
                  fontWeight: FontWeight.normal)),
          WidgetSpan(child: SizedBox(width: subTitle.isEmpty ? 0.w: 4.w)),
          TextSpan(
              text: caption,
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 14.sp,
                  height: 1.5,
                  fontWeight: FontWeight.bold)),
          WidgetSpan(child: SizedBox(width: caption.isEmpty ? 0.w: 4.w)),
          TextSpan(
              text: subCaption,
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
