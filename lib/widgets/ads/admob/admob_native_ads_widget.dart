import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/admob_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shoe_size/utils/app_colors.dart';

class AdMobNativeAdsWidget extends StatefulWidget {
  const AdMobNativeAdsWidget({super.key});

  @override
  State<AdMobNativeAdsWidget> createState() => _AdMobNativeAdsWidgetState();
}

class _AdMobNativeAdsWidgetState extends State<AdMobNativeAdsWidget> {
  NativeAd? nativeAd;
  bool isNativeAdLoaded = false;

  Future<void> loadNativeAd() async {
    debugPrint('Admob NativeAd Called.');
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    nativeAd = NativeAd(
      adUnitId: AdMobManager.getNativeAdUnitID(),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium,
          mainBackgroundColor: AppColors.adWhite12,
          callToActionTextStyle: NativeTemplateTextStyle(size: 16),
          primaryTextStyle: NativeTemplateTextStyle(
              textColor: AppColors.adBlue, backgroundColor: AppColors.white),
          secondaryTextStyle: NativeTemplateTextStyle(
              textColor: AppColors.adBlue, backgroundColor: AppColors.white),
          tertiaryTextStyle: NativeTemplateTextStyle(
              textColor: AppColors.adBlue, backgroundColor: AppColors.white)),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('Admob NativeAd Loaded : ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            nativeAd = ad as NativeAd;
            isNativeAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Admob NativeAd onFailed : $error');
          ad.dispose();
        },
      ),
    );
    return nativeAd?.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (AdMobManager.getNativeAdUnitID().isNotEmpty) {
      loadNativeAd();
    }
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return nativeAd != null && isNativeAdLoaded
        ? ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 320, // minimum recommended width
                minHeight: 320, // minimum recommended height
                maxWidth: 400,
                maxHeight: 400),
            child: AdWidget(ad: nativeAd!))
        : const SizedBox();
  }
}
