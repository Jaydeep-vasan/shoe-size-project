import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobManager {
  static InterstitialAd? interstitialAd;
  static int interstitialAdLoadAttempts = 0;
  static int maxInterstitialAdLoadFailAttempts = 3;

  static String releaseBannerAdId =
  Platform.isAndroid ? 'ca-app-pub-1606125081137557/4430337392' : '';
  static String releaseNativeAdId =
  Platform.isAndroid ? 'ca-app-pub-1606125081137557/7278134184' : '';
  static String releaseInterstitialAdId =
  Platform.isAndroid ? 'ca-app-pub-1606125081137557/5401456521' : '';

  static String debugBannerAdId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  static String debugNativeAdId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-3940256099942544/3986624511';
  static String debugInterstitialAdId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

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

  static void showInterstitialAd() {
    debugPrint('Admob Show InterstitialAd Called.');
    if (interstitialAd == null) {
      return;
    }

    interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        debugPrint('Admob Interstitial Ads Show onComplete');
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        debugPrint('Admob Interstitial Ads Show onFailed : $ad : $error');
        ad.dispose();
      },
    );
    interstitialAd?.show();
    interstitialAd = null;
  }

  static Future<void> loadInterstitialAd() async {
    debugPrint('Admob Load InterstitialAd Called.');
    InterstitialAd.load(
      adUnitId: getInterstitialAdUnitID(),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('Admob Interstitial Ads Load onAdLoaded $ad');
          interstitialAd = ad;

          showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('Admob Interstitial Ads Load onAdFailedToLoad : $error');
          interstitialAd = null;
        },
      ),
    );
  }

  static void setupBannerAdIds(
      {required String adMobBannerAdAndroid,
        required String adMobBannerAdIOS}) {
    if (Platform.isAndroid) {
      if (adMobBannerAdAndroid.isNotEmpty) {
        releaseBannerAdId = adMobBannerAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (adMobBannerAdIOS.isNotEmpty) {
        releaseBannerAdId = adMobBannerAdIOS;
      }
    }
    debugPrint(
        'adMobBannerAdAndroid:$adMobBannerAdAndroid, adMobBannerAdIOS: $adMobBannerAdIOS');
  }

  static void setupInterstitialAdIds(
      {required String adMobInterstitialAdAndroid,
        required String adMobInterstitialAdIOS}) {
    if (Platform.isAndroid) {
      if (adMobInterstitialAdAndroid.isNotEmpty) {
        releaseInterstitialAdId = adMobInterstitialAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (adMobInterstitialAdIOS.isNotEmpty) {
        releaseInterstitialAdId = adMobInterstitialAdIOS;
      }
    }
    debugPrint(
        'adMobInterstitialAdAndroid: $adMobInterstitialAdAndroid, adMobInterstitialAdIOS: $adMobInterstitialAdIOS');
  }

  static void setupNativeAdIds(
      {required String adMobNativeAdAndroid,
        required String adMobNativeAdIOS}) {
    if (Platform.isAndroid) {
      if (adMobNativeAdAndroid.isNotEmpty) {
        releaseNativeAdId = adMobNativeAdAndroid;
      }
    } else if (Platform.isIOS) {
      if (adMobNativeAdIOS.isNotEmpty) {
        releaseNativeAdId = adMobNativeAdIOS;
      }
    }
    debugPrint(
        'adMobNativeAdAndroid:$adMobNativeAdAndroid, adMobNativeAdIOS: $adMobNativeAdIOS');
  }
}

