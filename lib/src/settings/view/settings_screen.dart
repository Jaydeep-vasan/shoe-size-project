import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/src/settings/view/widget/primary_setting_tile_widget.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/utils/app_routes.dart';
import 'package:shoe_size/widgets/ads/type1_native_ads_widget.dart';
import 'package:shoe_size/widgets/appbar/primary_appbar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppbarWidget(title: AppStrings.strSetting.tr),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
                child: Column(
          children: [
            PrimarySettingTileWidget(
                title: AppStrings.strTranslation.tr,
                imgPath: AppImages.language,
                onTap: () async {
                  Get.toNamed(AppRoutes.routeChangeLanguage);
                }),
            SizedBox(height: 8.h),
            PrimarySettingTileWidget(
                title: AppStrings.strHowToCalculateShoeSize.tr,
                imgPath: AppImages.measurement,
                onTap: () async {
                  Get.toNamed(AppRoutes.routeHowToCalculateShoeSize);
                }),
            SizedBox(height: 8.h),
            PrimarySettingTileWidget(
                title: AppStrings.strShoeSizeChart.tr,
                imgPath: AppImages.shoe,
                onTap: () async {
                  Get.toNamed(AppRoutes.routeShoeSizeChart);
                }),
            SizedBox(height: 24.h),
            const Type1NativeAdsWidget(),
            SizedBox(height: 24.h)
          ],
        ).paddingSymmetric(vertical: 16.h, horizontal: 16.w))));
  }
}
