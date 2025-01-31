import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';
import 'package:flutter/material.dart';

class PrimaryIconTextButtonWidget extends StatelessWidget {
  const PrimaryIconTextButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});

  final Icon icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: icon,
            color: AppColors.appMaterialColor),
        PrimarySemiBoldTextWidget(
            title: title,
            semiBoldTextType: SemiBoldTextType.semiBold14,
            color: AppColors.thumb)
      ],
    );
  }
}
