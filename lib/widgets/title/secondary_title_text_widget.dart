import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/button/primary_icon_button_widget.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondaryTitleTextWidget extends StatelessWidget {
  const SecondaryTitleTextWidget(
      {required this.title,
      required this.buttonText,
      required this.onTap,
      this.iconData,
      super.key});

  final String title;
  final String buttonText;
  final VoidCallback onTap;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(color: AppColors.border),
              top: BorderSide(color: AppColors.border),
              bottom: BorderSide(color: AppColors.border))),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(color: AppColors.primary, width: 4.w),
            SizedBox(width: 8.w),
            Expanded(
                child: PrimarySemiBoldTextWidget(
                        title: title,
                        semiBoldTextType: SemiBoldTextType.semiBold20,
                        color: AppColors.text)
                    .paddingSymmetric(vertical: 12.h)),
            SizedBox(width: 8.w),
            PrimaryIconButtonWidget(
                iconData: iconData,
                title: buttonText,
                onTap: onTap,
                borderRadius: 0,
                padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h)),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
