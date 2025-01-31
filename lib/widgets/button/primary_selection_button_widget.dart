import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';

class PrimarySelectionButtonWidget extends StatelessWidget {
  const PrimarySelectionButtonWidget(
      {required this.title,
      required this.description,
      required this.imgPath,
      required this.isSelected,
      required this.onTap,
      super.key});

  final String title;
  final String description;
  final String imgPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isSelected ? AppColors.secondary : AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.gray, blurRadius: 5, spreadRadius: 1)
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imgPath,
                        height: 20.h, width: 20.h, fit: BoxFit.cover),
                    SizedBox(width: 4.w),
                    PrimaryMediumTextWidget(
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                        title: title,
                        mediumTextType: MediumTextType.medium14,
                        color: isSelected
                            ? AppColors.white
                            : AppColors.primaryDark),
                  ],
                ),
                PrimaryNormalTextWidget(
                    title: description,
                    normalTextType: NormalTextType.normal10,
                    color: isSelected ? AppColors.white : AppColors.text)
              ],
            )));
  }
}
