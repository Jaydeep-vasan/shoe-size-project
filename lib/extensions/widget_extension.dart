import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WidgetExtensions on Widget {
  Widget appendAsterisk() {
    return Row(
      children: [
        this,
        PrimaryMediumTextWidget(
            title: AppStrings.strAsterisk.tr,
            mediumTextType: MediumTextType.medium16,
            color: AppColors.error)
      ],
    );
  }
}
