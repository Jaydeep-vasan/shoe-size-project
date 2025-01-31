// import 'dart:io';
// import 'package:shoe_size/app_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:unity_ads_plugin/unity_ads_plugin.dart';
//
// class UnityAdManager {
//   static double bannerHeight = 50;
//   static int interstitialAdLoadAttempts = 0;
//   static int maxInterstitialAdLoadFailAttempts = 3;
//
//   static String projectId = Platform.isAndroid ? '5713940' : '5713941';
//   static String releaseBannerAdId =
//       Platform.isAndroid ? 'Banner_Android' : 'Banner_iOS';
//   static String releaseInterstitialAdId =
//       Platform.isAndroid ? 'Interstitial_Android' : 'Interstitial_iOS';
//
//   static String getBannerAdUnitID() {
//     return releaseBannerAdId;
//   }
//
//   static String getInterstitialAdUnitID() {
//     return releaseInterstitialAdId;
//   }
//
//   static void showInterstitialAd() {
//     debugPrint('Unity Show InterstitialAd Called.');
//     UnityAds.showVideoAd(
//       placementId: getInterstitialAdUnitID(),
//       onComplete: (placementId) {
//         debugPrint(
//             'Unity Interstitial Ads Show onComplete : $placementId completed');
//       },
//       onFailed: (placementId, error, message) {
//         debugPrint(
//             'Unity Interstitial Ads Show onFailed : $placementId : $error : $message');
//       },
//     );
//   }
//
//   static Future<void> loadInterstitialAd() async {
//     debugPrint('Unity Load InterstitialAd Called.');
//     if (await UnityAds.isInitialized() == false) {
//       AppProvider appProvider =
//           Provider.of<AppProvider>(Get.context!, listen: false);
//       appProvider.showUnityInterstitialAd();
//
//       return;
//     }
//
//     UnityAds.load(
//         placementId: getInterstitialAdUnitID(),
//         onComplete: (placementId) {
//           debugPrint('Unity Interstitial Ads Load onComplete $placementId');
//
//           showInterstitialAd();
//         },
//         onFailed: (placementId, error, message) {
//           debugPrint(
//               'Unity Interstitial Ads Load onFailed : $placementId : $error : $message');
//         });
//
//     AppProvider appProvider =
//         Provider.of<AppProvider>(Get.context!, listen: false);
//     appProvider.showUnityInterstitialAd();
//   }
//
//   static void setupBannerAdIds(
//       {required String unityBannerAdAndroid,
//       required String unityBannerAdIOS}) {
//     if (Platform.isAndroid) {
//       if (unityBannerAdAndroid.isNotEmpty) {
//         releaseBannerAdId = unityBannerAdAndroid;
//       }
//     } else if (Platform.isIOS) {
//       if (unityBannerAdIOS.isNotEmpty) {
//         releaseBannerAdId = unityBannerAdIOS;
//       }
//     }
//     debugPrint(
//         'unityBannerAdAndroid:$unityBannerAdAndroid, unityBannerAdIOS: $unityBannerAdIOS');
//   }
//
//   static void setupInterstitialAdIds(
//       {required String unityInterstitialAdAndroid,
//       required String unityInterstitialAdIOS}) {
//     if (Platform.isAndroid) {
//       if (unityInterstitialAdAndroid.isNotEmpty) {
//         releaseInterstitialAdId = unityInterstitialAdAndroid;
//       }
//     } else if (Platform.isIOS) {
//       if (unityInterstitialAdIOS.isNotEmpty) {
//         releaseInterstitialAdId = unityInterstitialAdIOS;
//       }
//     }
//     debugPrint(
//         'unityInterstitialAdAndroid: $unityInterstitialAdAndroid, unityInterstitialAdIOS: $unityInterstitialAdIOS');
//   }
// }
