import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/app_provider.dart';
import 'package:shoe_size/helper/preferences_helper.dart';
import 'package:shoe_size/localization/app_translations.dart';
import 'package:shoe_size/localization/cupertino_localisation_delegate.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/app_constants.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/utils/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
      statusBarBrightness: Brightness.dark));
  FlutterError.onError = (details) {
    debugPrint(
        'flutter error : ${details.exceptionAsString()} : ${details.stack} : ${details.toString()}');
  };

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await PreferenceHelper.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppProvider appProvider = AppProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(create: (_) => appProvider),
        ],
        child: Consumer<AppProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return Directionality(
                textDirection: TextDirection.ltr,
                child: Scaffold(
                    backgroundColor: AppColors.white,
                    body: SafeArea(
                        child: Center(
                            child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.boxShadow,
                                          blurRadius: 5,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: AppColors.boxShadow,
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ]),
                                margin:
                                const EdgeInsets.symmetric(horizontal: 16),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Image.asset(AppImages.imgAppLogo,
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.contain)))))));
          } else {
            return ScreenUtilInit(
              // Mobiles: 360×800, 390×844, 414×896
              // Tablets: 768×1024, 800×1280, 1280×800
              // designSize: const Size(375, 812),
                designSize: MediaQuery.of(context).size.width < 600
                    ? const Size(375, 812)
                    : const Size(768, 1024),
                builder: (BuildContext context, Widget? child) =>
                    GetMaterialApp(
                        debugShowCheckedModeBanner: false,
                        fallbackLocale: const Locale('en'),
                        locale: Get.locale,
                        translations: AppTranslations(),
                        supportedLocales: value.supportedLocales,
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          FallbackCupertinoLocalisationsDelegate(),
                        ],
                        theme: ThemeData(
                            primarySwatch: AppColors.appMaterialColor,
                            fontFamily: AppConstants.mulishFonts,
                            unselectedWidgetColor: AppColors.text,
                            scaffoldBackgroundColor: AppColors.white,
                            floatingActionButtonTheme:
                            const FloatingActionButtonThemeData(
                                backgroundColor: AppColors.primary),
                            appBarTheme:
                            const AppBarTheme(color: AppColors.primary)),
                        initialRoute: value.initialRoute,
                        getPages: AppPages.appPages));
          }
        }));
  }
}
