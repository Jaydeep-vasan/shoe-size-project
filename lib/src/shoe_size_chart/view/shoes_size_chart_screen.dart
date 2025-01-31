import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/src/dashboard/controller/dashboard_controller.dart';
import 'package:shoe_size/src/shoe_size_chart/view/widget/shoe_size_table_heading_widget.dart';
import 'package:shoe_size/src/shoe_size_chart/view/widget/shoe_size_table_widget.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/widgets/ads/type1_banner_ads_widget.dart';
import 'package:shoe_size/widgets/appbar/primary_appbar_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class ShoeSizeChartScreen extends StatefulWidget {
  const ShoeSizeChartScreen({super.key});

  @override
  State<ShoeSizeChartScreen> createState() => _ShoeSizeChartScreenState();
}

class _ShoeSizeChartScreenState extends State<ShoeSizeChartScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppbarWidget(title: AppStrings.strShoeSizeChart.tr),
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.male, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strMaleConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeMaleList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController
                                    .shoeSizeMaleList.shoeSizeUKList[index],
                                eu: dashboardController
                                    .shoeSizeMaleList.shoeSizeEUList[index],
                                cm: dashboardController
                                    .shoeSizeMaleList.shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController
                                    .shoeSizeMaleList.shoeSizeUSList[index],
                                inch: dashboardController
                                    .shoeSizeMaleList.shoeSizeINCHList[index]);
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Image.asset(AppImages.female, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strFemaleConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeFemaleList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController
                                    .shoeSizeFemaleList.shoeSizeUKList[index],
                                eu: dashboardController
                                    .shoeSizeFemaleList.shoeSizeEUList[index],
                                cm: dashboardController
                                    .shoeSizeFemaleList.shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController
                                    .shoeSizeFemaleList.shoeSizeUSList[index],
                                inch: dashboardController.shoeSizeFemaleList
                                    .shoeSizeINCHList[index]);
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Image.asset(AppImages.bigKids, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strBigKidsConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeBigKidsList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController
                                    .shoeSizeBigKidsList.shoeSizeUKList[index],
                                eu: dashboardController
                                    .shoeSizeBigKidsList.shoeSizeEUList[index],
                                cm: dashboardController
                                    .shoeSizeBigKidsList.shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController
                                    .shoeSizeBigKidsList.shoeSizeUSList[index],
                                inch: dashboardController.shoeSizeBigKidsList
                                    .shoeSizeINCHList[index]);
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Image.asset(AppImages.littleKids, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strLittleKidsConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeLittleKidsList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController.shoeSizeLittleKidsList
                                    .shoeSizeUKList[index],
                                eu: dashboardController.shoeSizeLittleKidsList
                                    .shoeSizeEUList[index],
                                cm: dashboardController.shoeSizeLittleKidsList
                                    .shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController.shoeSizeLittleKidsList
                                    .shoeSizeUSList[index],
                                inch: dashboardController.shoeSizeLittleKidsList
                                    .shoeSizeINCHList[index]);
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Image.asset(AppImages.toddlers, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strToddlersConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeToddlersList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController
                                    .shoeSizeToddlersList.shoeSizeUKList[index],
                                eu: dashboardController
                                    .shoeSizeToddlersList.shoeSizeEUList[index],
                                cm: dashboardController
                                    .shoeSizeToddlersList.shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController
                                    .shoeSizeToddlersList.shoeSizeUSList[index],
                                inch: dashboardController.shoeSizeToddlersList
                                    .shoeSizeINCHList[index]);
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Image.asset(AppImages.infants, height: 40.h),
                          SizedBox(width: 8.w),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strInfantsConversion.tr,
                              boldTextType: BoldTextType.bold16)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const ShoeSizeTableHeadingWidget(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dashboardController
                              .shoeSizeInfantsList.shoeSizeUKList.length,
                          itemBuilder: (context, index) {
                            return ShoeSizeTableWidget(
                                uk: dashboardController
                                    .shoeSizeInfantsList.shoeSizeUKList[index],
                                eu: dashboardController
                                    .shoeSizeInfantsList.shoeSizeEUList[index],
                                cm: dashboardController
                                    .shoeSizeInfantsList.shoeSizeCMList[index],
                                itemColor: index.isEven
                                    ? AppColors.white
                                    : AppColors.gray,
                                us: dashboardController
                                    .shoeSizeInfantsList.shoeSizeUSList[index],
                                inch: dashboardController.shoeSizeInfantsList
                                    .shoeSizeINCHList[index]);
                          })
                    ],
                  ).paddingSymmetric(horizontal: 16.w, vertical: 16.h))),
          const Type1BannerAdsWidget()
        ])));
  }
}
