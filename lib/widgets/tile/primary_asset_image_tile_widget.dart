import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_size/widgets/img/primary_asset_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryAssetImageTileWidget extends StatelessWidget {
  final String title;
  final String imgPath;
  final Color tileColor;

  const PrimaryAssetImageTileWidget(
      {super.key,
      required this.title,
      required this.imgPath,
      required this.tileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: tileColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryAssetWidget(
              imgPath: imgPath,
              color: tileColor,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.cover),
          SizedBox(width: 12.w),
          Flexible(
              child: PrimaryBoldTextWidget(
                  title: title,
                  boldTextType: BoldTextType.bold14,
                  color: tileColor,
                  maxLines: 2))
        ],
      ),
    );
  }
}
