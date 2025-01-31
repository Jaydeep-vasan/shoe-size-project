import 'package:flutter/cupertino.dart';
import 'package:shoe_size/widgets/text/primary_semi_bold_text_widget.dart';

class PrimaryBulletTileWidget extends StatelessWidget {
  const PrimaryBulletTileWidget(
      {super.key, required this.title, this.textColor});

  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(bullet, color: bulletColor),
        PrimarySemiBoldTextWidget(
            title: '• $title',
            semiBoldTextType: SemiBoldTextType.semiBold16,
            color: textColor)
      ],
    );
  }
}
