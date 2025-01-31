import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoRecordsFoundWidget extends StatelessWidget {
  const NoRecordsFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.imgNoRecords, fit: BoxFit.contain, height: 120.h),
        SizedBox(height: 12.h),
        PrimaryBoldTextWidget(
            boldTextType: BoldTextType.bold16,
            title: AppStrings.strNoRecordsFound.tr,
            textAlign: TextAlign.center),
      ],
    );
  }
}
