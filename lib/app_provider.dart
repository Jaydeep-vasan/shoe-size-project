import 'dart:async';
import 'dart:io';
import 'package:applovin_max/applovin_max.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shoe_size/firebase_options.dart';
import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/helper/preferences_helper.dart';
import 'package:shoe_size/utils/admob_manager.dart';
import 'package:shoe_size/utils/app_constants.dart';
import 'package:shoe_size/utils/app_enums.dart';
import 'package:shoe_size/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/utils/applovin_ad_manager.dart';
import 'package:shoe_size/utils/fb_ad_manager.dart';

class AppProvider with ChangeNotifier {
  String initialRoute = AppRoutes.routeDashboard;
  bool isLoading = true;

  // 0: Admob, 1: FB, 2: AppLovin
  Type1AdNetworks type1LastShownBannerAdNetwork = Type1AdNetworks.admob;
  Type1AdNetworks type1LastShownNativeAdNetwork = Type1AdNetworks.admob;
  Type1AdNetworks type1LastShownInterstitialAdNetwork = Type1AdNetworks.admob;

  // Setup ad flow
  int shownAdMobBannerAds = 0;
  int shownFbBannerAds = 0;
  int shownAppLovinBannerAds = 0;
  int shownAdMobNativeAds = 0;
  int shownFbNativeAds = 0;
  int shownAppLovinNativeAds = 0;
  int shownAdMobInterstitialAds = 0;
  int shownFbInterstitialAds = 0;
  int shownAppLovinInterstitialAds = 0;

  // Remote Config Keys
  int forceUpdateBuildNumber = 0;

  // Max Ad Count For Android Ad Units
  int maxAdMobBannerAdsPerHour = 0;
  int maxFbBannerAdsPerHour = 0;
  int maxAppLovinBannerAdsPerHour = 0;
  int maxAdMobInterstitialAdsPerHour = 0;
  int maxFbInterstitialAdsPerHour = 0;
  int maxAppLovinInterstitialAdsPerHour = 0;
  int maxAdMobNativeAdsPerHour = 0;
  int maxFbNativeAdsPerHour = 0;
  int maxAppLovinNativeAdsPerHour = 0;

  // Max Ad Count For ios Ad Units
  int maxAdMobBannerAdsPerHourIOS = 0;
  int maxFbBannerAdsPerHourIOS = 0;
  int maxAppLovinBannerAdsPerHourIOS = 0;
  int maxAdMobInterstitialAdsPerHourIOS = 0;
  int maxFbInterstitialAdsPerHourIOS = 0;
  int maxAppLovinInterstitialAdsPerHourIOS = 0;
  int maxAdMobNativeAdsPerHourIOS = 0;
  int maxFbNativeAdsPerHourIOS = 0;
  int maxAppLovinNativeAdsPerHourIOS = 0;

  // Android FB & AdMob Values.
  String adMobBannerAdAndroid = '';
  String adMobNativeAdAndroid = '';
  String adMobInterstitialAdAndroid = '';
  String fbBannerAdAndroid = '';
  String fbNativeAdAndroid = '';
  String fbInterstitialAdAndroid = '';
  String applovinBannerAdAndroid = '';
  String applovinNativeAdAndroid = '';
  String applovinInterstitialAdAndroid = '';

  // iOS FB & AdMob Values.
  String adMobBannerAdIOS = '';
  String adMobNativeAdIOS = '';
  String adMobInterstitialAdIOS = '';
  String fbBannerAdIOS = '';
  String fbNativeAdIOS = '';
  String fbInterstitialAdIOS = '';
  String applovinBannerAdIOS = '';
  String applovinNativeAdIOS = '';
  String applovinInterstitialAdIOS = '';

  // Locale setup
  static const Locale enLocale = Locale('en');
  static const Locale zhLocale = Locale('zh');
  static const Locale jaLocale = Locale('ja');
  static const Locale hiLocale = Locale('hi');
  static const Locale ruLocale = Locale('ru');
  static const Locale deLocale = Locale('de');
  static const Locale esLocale = Locale('es');
  static const Locale ptLocale = Locale('pt');

  List<Locale> get supportedLocales => [
        enLocale,
        zhLocale,
        jaLocale,
        hiLocale,
        ruLocale,
        deLocale,
        esLocale,
        ptLocale
      ];

  String getAppLanguage() {
    String langCode =
        PreferenceHelper.getString(AppConstants.prefKeyLanguageCode) ?? '';

    return langCode.isEmpty ? 'en' : langCode;
  }

  Future<void> setAppLanguage({required String languageCode}) async {
    debugPrint('languageCode : $languageCode');
    PreferenceHelper.setString(AppConstants.prefKeyLanguageCode, (languageCode).toLowerCase());
    Get.updateLocale(Locale(languageCode));
    notifyListeners();
  }

  AppProvider() {
    initialSetup();
  }

  Future<void> initialSetup() async {
    debugPrint('Perform Initial Setup');
    // Set App Language
    String languageCode = getAppLanguage();
    setAppLanguage(languageCode: languageCode);

    // Setup network connectivity.
    await ConnectionHelper().setUpConnectivity();

    // Initialise firebase.
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // Initialise Admob SDK.
    await MobileAds.instance.initialize();
    if (kDebugMode) {
      MobileAds.instance
          .updateRequestConfiguration(RequestConfiguration(testDeviceIds: [
        'DE1F7FE89F73234FDCDF62661784D99E', // Jay (Redmi Y2)
        '20A1EE16F43E3D7F76451FED93716B3B', // Jaydeep (Realme C25)
      ]));
    }

    // Initialise Facebook Audience Network SDK.
    FacebookAudienceNetwork.init(
      // testingId: '0fbe907c-1e55-4074-903c-a1fdf8710e1d', // Jay (Redmi Y2)
      testingId: 'bba1ba5d-3ec4-446a-bb71-ee4f9bcc799a', // Jaydeep (Realme C25)
    );

    // Initialize AppLovin SDK.
    AppLovinMAX.setTestDeviceAdvertisingIds([
      'a14be04c-5b64-4cbe-a14e-302365d0816c', // Jay (Redmi Y2)
    ]);
    MaxConfiguration? configuration = await AppLovinMAX.initialize(AppLovinAdManager.sdkKey);
    if (configuration != null) {
      AppLovinAdManager.isInitialized = true;
    }

    // Initialise remote configs.
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 15),
          minimumFetchInterval: Duration.zero));
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('remoteConfig load error : ${e.toString()}');
    }

    forceUpdateBuildNumber = Platform.isAndroid
        ? remoteConfig.getInt(AppConstants.keyForceUpdateBuildNumber)
        : remoteConfig.getInt(AppConstants.keyForceUpdateBuildNumberIOS);

    // Android Keys
    maxAdMobBannerAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAdmobAdsCount);
    maxFbBannerAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxFbAdsCount);
    maxAppLovinBannerAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAppLovinAdsCount);
    maxAdMobInterstitialAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAdmobInterstitialAdsCount);
    maxFbInterstitialAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxFbInterstitialAdsCount);
    maxAppLovinInterstitialAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAppLovinInterstitialAdsCount);
    maxAdMobNativeAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAdmobNativeAdsCount);
    maxFbNativeAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxFbNativeAdsCount);
    maxAppLovinNativeAdsPerHour = remoteConfig.getInt(AppConstants.keyMaxAppLovinNativeAdsCount);

    // IOS Keys
    maxAdMobBannerAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAdmobAdsCountIOS);
    maxFbBannerAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxFbAdsCountIOS);
    maxAppLovinBannerAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAppLovinAdsCountIOS);
    maxAdMobInterstitialAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAdmobInterstitialAdsCountIOS);
    maxFbInterstitialAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxFbInterstitialAdsCountIOS);
    maxAppLovinInterstitialAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAppLovinInterstitialAdsCountIOS);
    maxAdMobNativeAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAdmobNativeAdsCountIOS);
    maxFbNativeAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxFbNativeAdsCountIOS);
    maxAppLovinNativeAdsPerHourIOS = remoteConfig.getInt(AppConstants.keyMaxAppLovinNativeAdsCountIOS);
    debugPrint('forceUpdateBuildNumber: $forceUpdateBuildNumber');

    if (maxAdMobBannerAdsPerHour > 0 || maxAdMobBannerAdsPerHourIOS > 0) {
      AdMobManager.setupBannerAdIds(
          adMobBannerAdAndroid: remoteConfig.getString(AppConstants.keyAdMobBannerAdAndroid),
          adMobBannerAdIOS: remoteConfig.getString(AppConstants.keyAdMobBannerAdIOS));

      startAdMobBannerTimer();
    }

    if (maxAdMobInterstitialAdsPerHour > 0 || maxAdMobInterstitialAdsPerHourIOS > 0) {
      AdMobManager.setupInterstitialAdIds(
          adMobInterstitialAdAndroid: remoteConfig.getString(AppConstants.keyAdMobInterstitialAdAndroid),
          adMobInterstitialAdIOS: remoteConfig.getString(AppConstants.keyAdMobInterstitialAdIOS));

      startAdMobInterstitialTimer();
    }

    if (maxAdMobNativeAdsPerHour > 0 || maxAdMobNativeAdsPerHourIOS > 0) {
      AdMobManager.setupNativeAdIds(
          adMobNativeAdAndroid: remoteConfig.getString(AppConstants.keyAdMobNativeAdAndroid),
          adMobNativeAdIOS: remoteConfig.getString(AppConstants.keyAdMobNativeAdIOS));

      startAdMobNativeTimer();
    }

    if (maxFbBannerAdsPerHour > 0 || maxFbBannerAdsPerHourIOS > 0) {
      FbAdManager.setupBannerAdIds(
          fbBannerAdAndroid: remoteConfig.getString(AppConstants.keyFBBannerAdAndroid),
          fbBannerAdIOS: remoteConfig.getString(AppConstants.keyFBBannerAdIOS));

      startFBBannerTimer();
    }

    if (maxFbInterstitialAdsPerHour > 0 || maxFbInterstitialAdsPerHourIOS > 0) {
      FbAdManager.setupInterstitialAdIds(
          fbInterstitialAdAndroid: remoteConfig.getString(AppConstants.keyFBInterstitialAdAndroid),
          fbInterstitialAdIOS: remoteConfig.getString(AppConstants.keyFBInterstitialAdIOS));

      startFBInterstitialTimer();
    }

    if (maxFbNativeAdsPerHour > 0 || maxFbNativeAdsPerHourIOS > 0) {
      FbAdManager.setupNativeAdIds(
          fbNativeAdAndroid: remoteConfig.getString(AppConstants.keyFBNativeAdAndroid),
          fbNativeAdIOS: remoteConfig.getString(AppConstants.keyFBNativeAdIOS));

      startFBNativeTimer();
    }

    if (maxAppLovinBannerAdsPerHour > 0 || maxAppLovinBannerAdsPerHourIOS > 0) {
      AppLovinAdManager.setupBannerAdIds(
          appLovinBannerAdAndroid: remoteConfig.getString(AppConstants.keyAppLovinBannerAdAndroid),
          appLovinBannerAdIOS: remoteConfig.getString(AppConstants.keyAppLovinBannerAdIOS));

      startAppLovinBannerTimer();
    }

    if (maxAppLovinInterstitialAdsPerHour > 0 || maxAppLovinInterstitialAdsPerHourIOS > 0) {
      AppLovinAdManager.setupInterstitialAdIds(
          appLovinInterstitialAdAndroid: remoteConfig.getString(AppConstants.keyAppLovinInterstitialAdAndroid),
          appLovinInterstitialAdIOS: remoteConfig.getString(AppConstants.keyAppLovinInterstitialAdIOS));

      startAppLovinInterstitialTimer();
    }

    if (maxAppLovinNativeAdsPerHour > 0 || maxAppLovinNativeAdsPerHourIOS > 0) {
      AppLovinAdManager.setupNativeAdIds(
          appLovinNativeAdAndroid: remoteConfig.getString(AppConstants.keyAppLovinNativeAdAndroid),
          appLovinNativeAdIOS: remoteConfig.getString(AppConstants.keyAppLovinNativeAdIOS));

      startAppLovinNativeTimer();
    }

    isLoading = false;
    notifyListeners();
  }

  bool canShowAdMobBannerAd() {
    return shownAdMobBannerAds < (Platform.isAndroid ? maxAdMobBannerAdsPerHour : maxAdMobBannerAdsPerHourIOS);
  }

  bool canShowFbBannerAd() {
    return shownFbBannerAds < (Platform.isAndroid ? maxFbBannerAdsPerHour : maxFbBannerAdsPerHourIOS);
  }

  bool canShowAppLovinBannerAd() {
    return shownAppLovinBannerAds < (Platform.isAndroid ? maxAppLovinBannerAdsPerHour : maxAppLovinBannerAdsPerHourIOS);
  }

  bool canShowAdMobNativeAd() {
    return shownAdMobNativeAds < (Platform.isAndroid ? maxAdMobNativeAdsPerHour : maxAdMobNativeAdsPerHourIOS);
  }

  bool canShowFbNativeAd() {
    return shownFbNativeAds < (Platform.isAndroid ? maxFbNativeAdsPerHour : maxFbNativeAdsPerHourIOS);
  }

  bool canShowAppLovinNativeAd() {
    return shownAppLovinNativeAds < (Platform.isAndroid ? maxAppLovinNativeAdsPerHour : maxAppLovinNativeAdsPerHourIOS);
  }

  bool canShowAdMobInterstitialAd() {
    return shownAdMobInterstitialAds < (Platform.isAndroid ? maxAdMobInterstitialAdsPerHour : maxAdMobInterstitialAdsPerHourIOS);
  }

  bool canShowFbInterstitialAd() {
    return shownFbInterstitialAds < (Platform.isAndroid ? maxFbInterstitialAdsPerHour : maxFbInterstitialAdsPerHourIOS);
  }

  bool canShowAppLovinInterstitialAd() {
    return shownAppLovinInterstitialAds < (Platform.isAndroid ? maxAppLovinInterstitialAdsPerHour : maxAppLovinInterstitialAdsPerHourIOS);
  }

  void showBannerAdNetwork(Type1AdNetworks network) {
    type1LastShownBannerAdNetwork = network;
    notifyListeners();
  }

  void showNativeAdNetwork(Type1AdNetworks network) {
    type1LastShownNativeAdNetwork = network;
    notifyListeners();
  }

  void showInterstitialAdNetwork(Type1AdNetworks network) {
    type1LastShownInterstitialAdNetwork = network;
    notifyListeners();
  }

  void startAdMobBannerTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAdMobBannerCounter());
  }

  void startAdMobInterstitialTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAdMobInterstitialCounter());
  }

  void startAdMobNativeTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAdMobNativeCounter());
  }

  void startFBBannerTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetFbBannerCounter());
  }

  void startFBInterstitialTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetFbInterstitialCounter());
  }

  void startFBNativeTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetFbNativeCounter());
  }

  void startAppLovinBannerTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAppLovinBannerCounter());
  }

  void startAppLovinInterstitialTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAppLovinInterstitialCounter());
  }

  void startAppLovinNativeTimer() {
    Timer.periodic(const Duration(hours: 1), (_) => resetAppLovinNativeCounter());
  }

  void resetAdMobBannerCounter() {
    shownAdMobBannerAds = 0;
    notifyListeners();
  }

  void resetAdMobInterstitialCounter() {
    shownAdMobInterstitialAds = 0;
    notifyListeners();
  }

  void resetAdMobNativeCounter() {
    shownAdMobNativeAds = 0;
    notifyListeners();
  }

  void resetFbBannerCounter() {
    shownFbBannerAds = 0;
    notifyListeners();
  }

  void resetFbInterstitialCounter() {
    shownFbInterstitialAds = 0;
    notifyListeners();
  }

  void resetFbNativeCounter() {
    shownFbNativeAds = 0;
    notifyListeners();
  }

  void resetAppLovinBannerCounter() {
    shownAppLovinBannerAds = 0;
    notifyListeners();
  }

  void resetAppLovinInterstitialCounter() {
    shownAppLovinInterstitialAds = 0;
    notifyListeners();
  }

  void resetAppLovinNativeCounter() {
    shownAppLovinNativeAds = 0;
    notifyListeners();
  }
}