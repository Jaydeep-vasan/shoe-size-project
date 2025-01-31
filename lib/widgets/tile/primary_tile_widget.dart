import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;

  const PrimaryTileWidget(
      {super.key, required this.title, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 16.w),
        PrimaryBoldTextWidget(title: title, boldTextType: BoldTextType.bold16)
      ],
    );
  }
}
