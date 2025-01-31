import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';
import 'package:flutter/material.dart';

class PrimaryTitleTextWidget extends StatelessWidget {
  const PrimaryTitleTextWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PrimaryMediumTextWidget(
        title: title,
        mediumTextType: MediumTextType.medium16,
        color: AppColors.text);
  }
}
