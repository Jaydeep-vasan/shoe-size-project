import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';

class PrimaryAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PrimaryAppbarWidget(
      {required this.title,
        this.height = kToolbarHeight,
        this.centerTitle = true,
        this.titleSpacing = 0,
        this.titleColor,
        this.leading,
        this.actions,
        super.key});

  final String title;
  final bool centerTitle;
  final double height;
  final double titleSpacing;
  final Color? titleColor;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.boxShadow,
        elevation: 4,
        titleSpacing: titleSpacing,
        centerTitle: centerTitle,
        leading: leading ?? const BackButton(color: AppColors.appBar),
        actions: actions,
        title: PrimaryBoldTextWidget(
            title: title,
            boldTextType: BoldTextType.bold16,
            color: titleColor ?? AppColors.appBar));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}