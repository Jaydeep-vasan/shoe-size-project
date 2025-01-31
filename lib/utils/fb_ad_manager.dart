import 'dart:io';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';

class FbAdManager {
  static String releaseBannerAdId =
  Platform.isAndroid ? '2810351542527166_2810373049191682' : '';
  static String releaseNativeAdId =
  Platform.isAndroid ? '2810351542527166_3948838258678483' : '';
  static String releaseInterstitialAdId =
  Platform.isAndroid ? '2810351542527166_2810355425860111' : '';

  static String debugBannerAdId = Platform.isAndroid
      ? 'IMG_16_9_APP_INSTALL#2810351542527166_2810373049191682'
      : 'IMG_16_9_APP_INSTALL#{placement_id}';
  static String debugNativeAdId = Platform.isAndroid
      ? 'IMG_16_9_APP_INSTALL#2810351542527166_3948838258678483'
      : 'IMG_16_9_APP_INSTALL#{placement_id}';
  static String debugInterstitialAdId =
  Platform.isAndroid ? '2810351542527166_2810355425860111' : '{placement_id}';

  static String getBannerAdUnitID() {
    if (kReleaseMode) {
      return releaseBannerAdId;
    } else {
      return debugBannerAdId;
    }
  }

  static String getNativeAdUnitID() {
    if (kReleaseMode) {
      return releaseNativeAdId;
    } else {
      return debugNativeAdId;
    }
  }

  static String getInterstitialAdUnitID() {
    if (kReleaseMode) {
      return releaseInterstitialAdId;
    } else {
      return debugInterstitialAdId;
    }
  }

  static Future<void> loadInterstitialAd() async {
    debugPrint('FB Load InterstitialAd Called.');
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: getInterstitialAdUnitID(),
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          debugPrint('FB Interstitial Ads Load onComplete');
          FacebookInterstitialAd.showInterstitialAd();
        } else if (result == InterstitialAdResult.ERROR) {
          debugPrint(
              'FB Interstitial Ads Load onFailed : ${result.toString()}');
        }
      },
    );
  }

  static void setupBannerAdIds(
      {required String fbBannerAdAndroid, required String fbBannerAdIOS}) {
    if (Platform.isAndroid) {
      if (fbBannerAdAndroid.isNotEmpty) {
        releaseBannerAdId = fbBannerAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (fbBannerAdIOS.isNotEmpty) {
        releaseBannerAdId = fbBannerAdIOS;
      }
    }

    debugPrint(
        'fbBannerAdAndroid: $fbBannerAdAndroid, fbBannerAdIOS: $fbBannerAdIOS');
  }

  static void setupInterstitialAdIds(
      {required String fbInterstitialAdAndroid,
        required String fbInterstitialAdIOS}) {
    if (Platform.isAndroid) {
      if (fbInterstitialAdAndroid.isNotEmpty) {
        releaseInterstitialAdId = fbInterstitialAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (fbInterstitialAdIOS.isNotEmpty) {
        releaseInterstitialAdId = fbInterstitialAdIOS;
      }
    }

    debugPrint(
        'fbInterstitialAdAndroid: $fbInterstitialAdAndroid, fbInterstitialAdIOS: $fbInterstitialAdIOS');
  }

  static void setupNativeAdIds(
      {required String fbNativeAdAndroid, required String fbNativeAdIOS}) {
    if (Platform.isAndroid) {
      if (fbNativeAdAndroid.isNotEmpty) {
        releaseNativeAdId = fbNativeAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (fbNativeAdIOS.isNotEmpty) {
        releaseNativeAdId = fbNativeAdIOS;
      }
    }

    debugPrint('fbNativeAdAndroid: $fbNativeAdAndroid, fbNativeAdIOS: $fbNativeAdIOS');
  }
}