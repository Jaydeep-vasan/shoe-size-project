import 'package:flutter/widgets.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextTileWidget extends StatelessWidget {
  final String title;
  final Color tileColor;

  const PrimaryTextTileWidget(
      {super.key, required this.title, required this.tileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: tileColor.withOpacity(0.1)),
        child: PrimaryBoldTextWidget(
                title: title,
                boldTextType: BoldTextType.bold14,
                color: tileColor,
                textAlign: TextAlign.center,
                maxLines: 1));
  }
}
