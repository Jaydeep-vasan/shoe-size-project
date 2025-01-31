import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';

class PrimaryLanguageSelectionBoxWidget extends StatelessWidget {
  const PrimaryLanguageSelectionBoxWidget(
      {required this.title,
      required this.isSelected,
      required this.onTap,
      required this.image,
      super.key});

  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.w,
                  color: isSelected ? AppColors.isSelected : AppColors.border),
              borderRadius: BorderRadius.circular(4),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 5,
                    spreadRadius: 0.5)
              ]),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 40.h,
                width: 40.h,
              ),
              SizedBox(width: 16.w),
              PrimaryMediumTextWidget(
                textAlign: TextAlign.center,
                  title: title,
                  mediumTextType: isSelected
                      ? MediumTextType.medium20
                      : MediumTextType.medium18,
                  color: isSelected
                      ? AppColors.checkBox
                      : AppColors.checkboxInactive)
            ],
          )),
    );
  }
}
