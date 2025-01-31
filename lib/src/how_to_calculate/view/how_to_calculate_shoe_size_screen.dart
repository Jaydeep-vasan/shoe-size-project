import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/widgets/ads/type1_banner_ads_widget.dart';
import 'package:shoe_size/widgets/appbar/primary_appbar_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';

class HowToCalculateShoeSizeScreen extends StatefulWidget {
  const HowToCalculateShoeSizeScreen({super.key});

  @override
  State<HowToCalculateShoeSizeScreen> createState() => _HowToCalculateShoeSizeScreenState();
}

class _HowToCalculateShoeSizeScreenState extends State<HowToCalculateShoeSizeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppbarWidget(title: AppStrings.strHowToCalculateShoeSize.tr),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryBoldTextWidget(
                title: AppStrings.strHowToCalculateShoeSize.tr,
                boldTextType: BoldTextType.bold18),
            Expanded(child: Image.asset(AppImages.calculate)),
            PrimaryNormalTextWidget(
                title: '${AppStrings.strBullet}${AppStrings.strCalculateShoeSizeP1.tr}',
                normalTextType: NormalTextType.normal14),
            SizedBox(height: 8.h),
            PrimaryNormalTextWidget(
                title: '${AppStrings.strBullet}${AppStrings.strCalculateShoeSizeP2.tr}',
                normalTextType: NormalTextType.normal14),
            const Type1BannerAdsWidget()
          ],
        ).paddingSymmetric(horizontal: 16.w, vertical: 16.h)));
  }
}
