import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_medium_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDrawerItemTileWidget extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PrimaryDrawerItemTileWidget(
      {super.key,
      required this.index,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: AppColors.secondaryLight,
        child: Container(
            color: index == 0 ? AppColors.secondaryLight : AppColors.transparent,
            child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                leading: Icon(icon,
                    size: 24,
                    color: index == 0 ? AppColors.primary : AppColors.text),
                title: Transform(
                    transform: Matrix4.translationValues(-16, 0.w, 0.w),
                    child: PrimaryMediumTextWidget(
                        title: title,
                        mediumTextType: MediumTextType.medium16,
                        color:
                            index == 0 ? AppColors.primary : AppColors.text)),
                onTap: onTap)));
  }
}
