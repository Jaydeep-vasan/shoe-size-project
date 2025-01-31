import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/applovin_ad_manager.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class AppLovinNativeAdsWidget extends StatefulWidget {
  const AppLovinNativeAdsWidget({super.key});

  @override
  State<AppLovinNativeAdsWidget> createState() =>
      _AppLovinNativeAdsWidgetState();
}

class _AppLovinNativeAdsWidgetState extends State<AppLovinNativeAdsWidget> {
  final MaxNativeAdViewController nativeAdViewController = MaxNativeAdViewController();
  static const double kMediaViewAspectRatio = 16 / 9;
  double mediaViewAspectRatio = kMediaViewAspectRatio;
  bool isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    nativeAdViewController.loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isAdLoaded ? const EdgeInsets.all(8) : EdgeInsets.zero,
      height: isAdLoaded ? AppLovinAdManager.nativeAdHeight : 0.01,
      child: MaxNativeAdView(
        adUnitId: AppLovinAdManager.getNativeAdUnitID(),
        controller: nativeAdViewController,
        listener: NativeAdListener(onAdLoadedCallback: (ad) {
          debugPrint('AppLovin NativeAd Loaded : $ad');
          setState(() {
            mediaViewAspectRatio =
                ad.nativeAd?.mediaContentAspectRatio ?? kMediaViewAspectRatio;
            isAdLoaded = true;
          });
        }, onAdLoadFailedCallback: (adUnitId, error) {
          debugPrint(
              'AppLovin NativeAd onFailed : ${error.message} : ${error.code}');
          setState(() {
            mediaViewAspectRatio = kMediaViewAspectRatio;
            isAdLoaded = false;
          });
        }, onAdClickedCallback: (ad) {
          debugPrint('AppLovin NativeAd Clicked');
        }, onAdRevenuePaidCallback: (ad) {
          debugPrint('AppLovin NativeAd Revenue Called.');
        }),
        child: Container(
          color: AppColors.applovinNativeAdBg,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(4),
                      child: const MaxNativeAdIconView(width: 48, height: 48)),
                  const Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaxNativeAdTitleView(
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.visible),
                        MaxNativeAdAdvertiserView(
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.fade),
                        MaxNativeAdStarRatingView(size: 10),
                      ],
                    ),
                  ),
                  const MaxNativeAdOptionsView(width: 20, height: 20),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: MaxNativeAdBodyView(
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis)),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                  child: AspectRatio(
                      aspectRatio: mediaViewAspectRatio,
                      child: const MaxNativeAdMediaView())),
              const SizedBox(
                  width: double.infinity,
                  child: MaxNativeAdCallToActionView(
                      style: ButtonStyle(
                          foregroundColor:
                              WidgetStatePropertyAll<Color>(AppColors.white),
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              AppColors.applovinNativeAdButtonBg),
                          textStyle: WidgetStatePropertyAll<TextStyle>(
                              TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))))),
            ],
          ),
        ),
      ),
    );
  }
}
