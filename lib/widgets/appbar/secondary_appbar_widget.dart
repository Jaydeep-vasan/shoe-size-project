import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class SecondaryAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SecondaryAppbarWidget(
      {required this.title,
      this.height = kToolbarHeight,
      this.centerTitle = true,
      this.titleSpacing = 0,
      this.titleColor,
      this.actions,
      super.key});

  final String title;
  final bool centerTitle;
  final double height;
  final double titleSpacing;
  final Color? titleColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.boxShadow,
        elevation: 0,
        titleSpacing: titleSpacing,
        centerTitle: centerTitle,
        leadingWidth: 0,
        actions: actions,
        title: centerTitle
            ? PrimaryBoldTextWidget(
                title: title,
                boldTextType: BoldTextType.bold16,
                color: titleColor ?? AppColors.appBar)
            : Transform(
                transform: Matrix4.translationValues(16.w, 0, 0),
                child: PrimaryBoldTextWidget(
                    title: title,
                    boldTextType: BoldTextType.bold18,
                    color: titleColor ?? AppColors.primaryDark)));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
