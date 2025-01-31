import 'dart:io';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/foundation.dart';

class AppLovinAdManager {
  static bool isInitialized = false;
  static double bannerAdHeight = 50;
  static double nativeAdHeight = 300;
  static String sdkKey =
      'OTDuisrJUyBekRAnrqTdPphz2yihGWIUlb6Mr1rChE6Okfwp8x16N77Woh8qd2dV_1qleRIJLnfl8azTKiOMT2';
  static String releaseBannerAdId =
      Platform.isAndroid ? '2d57460c6195e325' : '';
  static String releaseNativeAdId =
      Platform.isAndroid ? '5f85aaf1221ce993' : '';
  static String releaseInterstitialAdId =
      Platform.isAndroid ? 'cf681ba4544ea0a9' : '';

  static String getBannerAdUnitID() {
    return releaseBannerAdId;
  }

  static String getNativeAdUnitID() {
    return releaseNativeAdId;
  }

  static String getInterstitialAdUnitID() {
    return releaseInterstitialAdId;
  }

  static Future<void> loadInterstitialAd() async {
    debugPrint('AppLovin Load InterstitialAd Called.');
    if (!isInitialized) {
      return;
    }

    AppLovinMAX.loadInterstitial(getInterstitialAdUnitID());
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        debugPrint('AppLovin Interstitial Ads Load onComplete');
        AppLovinMAX.showInterstitial(getInterstitialAdUnitID());
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        debugPrint(
            'AppLovin Interstitial Ads Load onFailed : $adUnitId : ${error.toString()}');
      },
      onAdDisplayedCallback: (ad) {
        debugPrint('AppLovin Interstitial Ads Show onComplete');
      },
      onAdDisplayFailedCallback: (ad, error) {
        debugPrint(
            'AppLovin Interstitial Ads Show onFailed : $ad : ${error.toString()}');
      },
      onAdClickedCallback: (MaxAd ad) {},
      onAdHiddenCallback: (MaxAd ad) {},
    ));
  }

  static void setupBannerAdIds(
      {required String appLovinBannerAdAndroid,
        required String appLovinBannerAdIOS}) {
    if (Platform.isAndroid) {
      if (appLovinBannerAdAndroid.isNotEmpty) {
        releaseBannerAdId = appLovinBannerAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (appLovinBannerAdIOS.isNotEmpty) {
        releaseBannerAdId = appLovinBannerAdIOS;
      }
    }
    debugPrint(
        'appLovinBannerAdAndroid:$appLovinBannerAdAndroid, appLovinBannerAdIOS: $appLovinBannerAdIOS');
  }

  static void setupInterstitialAdIds(
      {required String appLovinInterstitialAdAndroid,
        required String appLovinInterstitialAdIOS}) {
    if (Platform.isAndroid) {
      if (appLovinInterstitialAdAndroid.isNotEmpty) {
        releaseInterstitialAdId = appLovinInterstitialAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (appLovinInterstitialAdIOS.isNotEmpty) {
        releaseInterstitialAdId = appLovinInterstitialAdIOS;
      }
    }
    debugPrint(
        'appLovinInterstitialAdAndroid: $appLovinInterstitialAdAndroid, appLovinInterstitialAdIOS: $appLovinInterstitialAdIOS');
  }

  static void setupNativeAdIds(
      {required String appLovinNativeAdAndroid,
        required String appLovinNativeAdIOS}) {
    if (Platform.isAndroid) {
      if (appLovinNativeAdAndroid.isNotEmpty) {
        releaseNativeAdId = appLovinNativeAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (appLovinNativeAdIOS.isNotEmpty) {
        releaseNativeAdId = appLovinNativeAdIOS;
      }
    }
    debugPrint(
        'appLovinNativeAdAndroid:$appLovinNativeAdAndroid, appLovinNativeAdIOS: $appLovinNativeAdIOS');
  }
}
