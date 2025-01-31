import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class PrimaryInkwellIconTextTileWidget extends StatelessWidget {
  const PrimaryInkwellIconTextTileWidget(
      {required this.title,
      required this.icon,
      required this.onTap,
      super.key});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(children: [
          Icon(icon, color: AppColors.hyperlink),
          SizedBox(width: 4.w),
          Expanded(
              child: PrimaryBoldTextWidget(
                  title: title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  boldTextType: BoldTextType.bold14,
                  color: AppColors.hyperlink)),
        ]).paddingSymmetric(horizontal: 8.w, vertical: 8.h));
  }
}
