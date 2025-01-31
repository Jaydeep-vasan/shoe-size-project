import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shoe_size/app_provider.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/src/dashboard/controller/dashboard_controller.dart';
import 'package:shoe_size/src/dashboard/view/widgets/primary_text_tile_widget.dart';
import 'package:shoe_size/src/dashboard/view/widgets/primary_result_dialog_widget.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/app_constants.dart';
import 'package:shoe_size/utils/app_enums.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/utils/app_routes.dart';
import 'package:shoe_size/utils/app_utils.dart';
import 'package:shoe_size/widgets/ads/type1_banner_ads_widget.dart';
import 'package:shoe_size/widgets/appbar/secondary_appbar_widget.dart';
import 'package:shoe_size/widgets/button/primary_button_widget.dart';
import 'package:shoe_size/widgets/button/primary_selection_button_widget.dart';
import 'package:shoe_size/widgets/dialog/secondary_dialog_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  String languageCode = '';

  Future<void> checkForAppUpdates() async {
    try {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      int buildNumber =
          int.tryParse(packageInfo.buildNumber.split('.').last) ?? 0;
      debugPrint(
          'buildNumber : $buildNumber : ${appProvider.forceUpdateBuildNumber}');

      if (appProvider.forceUpdateBuildNumber > buildNumber) {
        showAppUpdateDialog(version: packageInfo.version);
      }
    } catch (e) {
      debugPrint('initSetup error: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();

    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    languageCode = appProvider.getAppLanguage();

    checkForAppUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SecondaryAppbarWidget(
          centerTitle: false,
          title: AppStrings.strAppName.tr,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.routeSettings);
                },
                icon: Icon(Icons.settings_outlined,
                    size: 32.h, color: AppColors.primaryDark)),
            SizedBox(width: 8.w)
          ],
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRoutes.routeHowToCalculateShoeSize);
                                  },
                                  child: PrimaryTextTileWidget(
                                      title: AppStrings.strCalculateShoeSize.tr,
                                      tileColor: AppColors.blue))),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strMale.tr,
                                      description:
                                          AppStrings.strMaleDescription.tr,
                                      imgPath: AppImages.male,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.male,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType.male);
                                      }))),
                              SizedBox(width: 4.w),
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strFemale.tr,
                                      description:
                                          AppStrings.strFemaleDescription.tr,
                                      imgPath: AppImages.female,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.female,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType.female);
                                      }))),
                              SizedBox(width: 4.w),
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strBigKids.tr,
                                      description:
                                          AppStrings.strBigKidsDescription.tr,
                                      imgPath: AppImages.bigKids,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.bigKids,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType.bigKids);
                                      })))
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strLittleKids.tr,
                                      description: AppStrings
                                          .strLittleKidsDescription.tr,
                                      imgPath: AppImages.littleKids,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.littleKids,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType
                                                        .littleKids);
                                      }))),
                              SizedBox(width: 4.w),
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strToddlers.tr,
                                      description:
                                          AppStrings.strToddlersDescription.tr,
                                      imgPath: AppImages.toddlers,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.toddlers,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType
                                                        .toddlers);
                                      }))),
                              SizedBox(width: 4.w),
                              Obx(() => Expanded(
                                  child: PrimarySelectionButtonWidget(
                                      title: AppStrings.strInfants.tr,
                                      description:
                                          AppStrings.strInfantsDescription.tr,
                                      imgPath: AppImages.infants,
                                      isSelected: dashboardController
                                              .selectedGenderValue ==
                                          ShoeSizeGenderType.infants,
                                      onTap: () {
                                        dashboardController
                                            .toggleSelectedGenderValue(
                                                shoeSizeGenderType:
                                                    ShoeSizeGenderType.infants);
                                      })))
                            ],
                          ),
                          SizedBox(height: 24.h),
                          PrimaryBoldTextWidget(
                              title: AppStrings.strSelectShoeSize.tr,
                              boldTextType: BoldTextType.bold16),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(child: Obx(() {
                                bool isSelected = dashboardController
                                        .selectedCountryTypeValue ==
                                    CountryType.us;
                                return PrimaryButtonWidget(
                                    title: AppStrings.strUS.tr,
                                    borderRadius: 4,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    fontSize: isSelected ? 18.sp : 12.sp,
                                    buttonColor: isSelected
                                        ? AppColors.primary
                                        : AppColors.gray,
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedCountryTypeValue(
                                              countryType: CountryType.us);
                                    });
                              })),
                              SizedBox(width: 8.w),
                              Expanded(child: Obx(() {
                                bool isSelected = dashboardController
                                        .selectedCountryTypeValue ==
                                    CountryType.uk;

                                return PrimaryButtonWidget(
                                    title: AppStrings.strUK.tr,
                                    borderRadius: 4,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    fontSize: isSelected ? 18.sp : 12.sp,
                                    buttonColor: isSelected
                                        ? AppColors.primary
                                        : AppColors.gray,
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedCountryTypeValue(
                                              countryType: CountryType.uk);
                                    });
                              })),
                              SizedBox(width: 8.w),
                              Expanded(child: Obx(() {
                                bool isSelected = dashboardController
                                        .selectedCountryTypeValue ==
                                    CountryType.eu;

                                return PrimaryButtonWidget(
                                    title: AppStrings.strEU.tr,
                                    borderRadius: 4,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    fontSize: isSelected ? 18.sp : 12.sp,
                                    buttonColor: isSelected
                                        ? AppColors.primary
                                        : AppColors.gray,
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedCountryTypeValue(
                                              countryType: CountryType.eu);
                                    });
                              })),
                              SizedBox(width: 8.w),
                              Expanded(child: Obx(() {
                                bool isSelected = dashboardController
                                        .selectedCountryTypeValue ==
                                    CountryType.cm;

                                return PrimaryButtonWidget(
                                    title: AppStrings.strCM.tr,
                                    borderRadius: 4,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    fontSize: isSelected ? 18.sp : 12.sp,
                                    buttonColor: isSelected
                                        ? AppColors.primary
                                        : AppColors.gray,
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedCountryTypeValue(
                                              countryType: CountryType.cm);
                                    });
                              })),
                              SizedBox(width: 8.w),
                              Expanded(child: Obx(() {
                                bool isSelected = dashboardController
                                        .selectedCountryTypeValue ==
                                    CountryType.inch;
                                return PrimaryButtonWidget(
                                    title: AppStrings.strINCH.tr,
                                    borderRadius: 4,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    fontSize: isSelected ? 18.sp : 12.sp,
                                    buttonColor: isSelected
                                        ? AppColors.primary
                                        : AppColors.gray,
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedCountryTypeValue(
                                              countryType: CountryType.inch);
                                    });
                              }))
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Obx(() {
                            List<double> shoeSizeList =
                                dashboardController.getCountryList(
                                    shoeSizeModel:
                                        dashboardController.getGenderList());

                            return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              itemCount: shoeSizeList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      dashboardController
                                          .toggleSelectedShoeSizeIndexValue(
                                              index: index);
                                    },
                                    child: Obx(() => Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            left: index == 0 ? 0.w : 4.w,
                                            right: index ==
                                                    (shoeSizeList.length - 1)
                                                ? 4.w
                                                : 0.w,
                                            top: 4.w,
                                            bottom: 8.h),
                                        decoration: BoxDecoration(
                                            color: dashboardController
                                                        .selectedShoeSizeIndexValue ==
                                                    index
                                                ? AppColors.primaryDark
                                                : AppColors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: AppColors.boxShadow,
                                                  blurRadius: 5,
                                                  spreadRadius: 0.01),
                                              BoxShadow(
                                                  color: AppColors.boxShadow,
                                                  blurRadius: 5,
                                                  spreadRadius: 0.01),
                                              BoxShadow(
                                                  color: AppColors.boxShadow,
                                                  blurRadius: 5,
                                                  spreadRadius: 0.01),
                                              BoxShadow(
                                                  color: AppColors.boxShadow,
                                                  blurRadius: 5,
                                                  spreadRadius: 0.01),
                                            ],
                                            shape: BoxShape.circle),
                                        child: dashboardController
                                                    .selectedShoeSizeIndexValue ==
                                                index
                                            ? PrimaryBoldTextWidget(
                                                title:
                                                    '${(shoeSizeList[index]) % 1 == 0 ? shoeSizeList[index].toInt() : shoeSizeList[index]}',
                                                boldTextType:
                                                    BoldTextType.bold16,
                                                color: AppColors.white)
                                            : PrimaryNormalTextWidget(
                                                title:
                                                    '${(shoeSizeList[index]) % 1 == 0 ? shoeSizeList[index].toInt() : shoeSizeList[index]}',
                                                normalTextType:
                                                    NormalTextType.normal12,
                                                color: AppColors.text))));
                              }
                            );
                          }),
                          SizedBox(height: 16.h),
                          PrimaryButtonWidget(
                              title: AppStrings.strSubmit.tr,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              onTap: () {
                                final (
                                  shoeSizeResultList,
                                  selectedShoeSizeModel
                                ) = dashboardController.calculateResult();
                                String selectedGenderImagePath =
                                    dashboardController
                                        .getSelectedGenderImagePathValue();
                                String selectedShoeSize = AppStrings
                                    .strSelectedShoeSizeLabel
                                    .trParams({
                                  'gender': dashboardController
                                      .getSelectedGenderValue(),
                                  'description':
                                      '(${dashboardController.getSelectedGenderDescriptionValue()})',
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PrimaryResultDialogWidget(
                                          selectedGenderImagePath:
                                              selectedGenderImagePath,
                                          selectedShoeSize: selectedShoeSize,
                                          selectedShoeSizeModel:
                                              selectedShoeSizeModel,
                                          shoeSizeResultList:
                                              shoeSizeResultList);
                                    });
                              }),
                          SizedBox(height: 16.h)
                        ],
                      ).paddingSymmetric(horizontal: 16.w))),
              const Type1BannerAdsWidget()
            ])));
  }

  void showAppUpdateDialog({required String version}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SecondaryDialogWidget(
            title: AppStrings.strUpdateAvailable.tr,
            message: AppStrings.strUpdateAvailableMessage.trParams({
              'appName': AppStrings.strAppName.tr,
              'version': version,
            }),
            buttonText: AppStrings.strUpdateNow.tr,
            onTap: () {
              AppUtils.launchURL(url: AppConstants.playStoreOrAppStoreURL);
              Get.back();
            },
          );
        });
  }

  void changeAppLanguage({required String languageCode}) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.setAppLanguage(languageCode: languageCode);
    Get.back();
  }
}
