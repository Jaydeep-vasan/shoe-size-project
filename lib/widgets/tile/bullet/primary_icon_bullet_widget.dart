import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';

class PrimaryIconBulletTileWidget extends StatelessWidget {
  const PrimaryIconBulletTileWidget(
      {super.key,
      required this.bullet,
      required this.title,
      this.textColor,
      this.bulletColor});

  final IconData bullet;
  final Color? bulletColor;
  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(bullet, color: bulletColor),
        SizedBox(width: 8.w),
        Expanded(
            child: PrimarySemiBoldTextWidget(
                title: title,
                semiBoldTextType: SemiBoldTextType.semiBold14,
                color: textColor))
      ],
    );
  }
}
