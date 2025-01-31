import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shoe_size/app_provider.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/src/dashboard/view/widgets/primary_language_selection_button_widget.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/widgets/ads/type1_native_ads_widget.dart';
import 'package:shoe_size/widgets/appbar/primary_appbar_widget.dart';
import 'package:shoe_size/widgets/button/primary_button_widget.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String languageCode = '';

  void getLanguage({required String language}) {
    setState(() {
      languageCode = language;
    });
  }

  @override
  void initState() {
    super.initState();

    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    languageCode = appProvider.getAppLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppbarWidget(title: AppStrings.strTranslation.tr),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strEnglish.tr,
                        isSelected: languageCode == 'en',
                        onTap: () {
                          getLanguage(language: 'en');
                        },
                        image: AppImages.american),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                      title: AppStrings.strChinese.tr,
                      isSelected: languageCode == 'zh',
                      onTap: () {
                        getLanguage(language: 'zh');
                      },
                      image: AppImages.chinese,
                    ),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strJapanese.tr,
                        isSelected: languageCode == 'ja',
                        onTap: () {
                          getLanguage(language: 'ja');
                        },
                        image: AppImages.japanese),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strHindi.tr,
                        isSelected: languageCode == 'hi',
                        onTap: () {
                          getLanguage(language: 'hi');
                        },
                        image: AppImages.indian),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strRussian.tr,
                        isSelected: languageCode == 'ru',
                        onTap: () {
                          getLanguage(language: 'ru');
                        },
                        image: AppImages.russian),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strGerman.tr,
                        isSelected: languageCode == 'de',
                        onTap: () {
                          getLanguage(language: 'de');
                        },
                        image: AppImages.german),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strSpanish.tr,
                        isSelected: languageCode == 'es',
                        onTap: () {
                          getLanguage(language: 'es');
                        },
                        image: AppImages.spanish),
                    SizedBox(height: 8.h),
                    PrimaryLanguageSelectionBoxWidget(
                        title: AppStrings.strPortuguese.tr,
                        isSelected: languageCode == 'pt',
                        onTap: () {
                          getLanguage(language: 'pt');
                        },
                        image: AppImages.portuguese),
                    SizedBox(height: 16.h),
                    PrimaryButtonWidget(
                        title: AppStrings.strApply.tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        onTap: () {
                          changeAppLanguage(languageCode: languageCode);
                        }),
                    SizedBox(height: 24.h),
                    const Type1NativeAdsWidget(),
                    SizedBox(height: 24.h)
                  ],
                ).paddingSymmetric(horizontal: 16.w, vertical: 16.h))));
  }

  void changeAppLanguage({required String languageCode}) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.setAppLanguage(languageCode: languageCode);
    Get.back();
  }
}
