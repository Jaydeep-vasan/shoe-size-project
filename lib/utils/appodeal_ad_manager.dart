// import 'package:shoe_size/app_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';
//
// class AppodealAdManager {
//   static String placementId = 'GenericAdUnits';
//   static String appId = 'b5fd8cc3b0adc784dcf736cccab1c621e204e8e8b5aa16f4';
//
//   static Future<void> loadInterstitialAd() async {
//     debugPrint('Appodeal Load InterstitialAd Called.');
//     bool isInitialized = await Appodeal.isInitialized(AppodealAdType.Interstitial);
//     bool canShow = await Appodeal.canShow(AppodealAdType.Interstitial, placementId);
//
//     if(isInitialized && canShow) {
//       Appodeal.setInterstitialCallbacks(
//           onInterstitialLoaded: (isPrecache) => debugPrint(
//               'Appodeal InterstitialAd Loaded: isPrecache - $isPrecache'),
//           onInterstitialFailedToLoad: () =>
//               debugPrint('Appodeal InterstitialAd Failed'),
//           onInterstitialShown: () => debugPrint('Appodeal InterstitialAd Shown'),
//           onInterstitialShowFailed: () =>
//               debugPrint('Appodeal InterstitialAd ShowFailed'));
//
//       Appodeal.show(AppodealAdType.Interstitial, placementId);
//
//       AppProvider appProvider = Provider.of<AppProvider>(Get.context!, listen: false);
//       appProvider.showFbInterstitialAd();
//     }
//   }
// }
