import 'package:shoe_size/utils/applovin_ad_manager.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class AppLovinBannerAdsWidget extends StatefulWidget {
  const AppLovinBannerAdsWidget({super.key});

  @override
  State<AppLovinBannerAdsWidget> createState() =>
      _AppLovinBannerAdsWidgetState();
}

class _AppLovinBannerAdsWidgetState extends State<AppLovinBannerAdsWidget> {
  bool isBannerAdLoaded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: isBannerAdLoaded ? AppLovinAdManager.bannerAdHeight : 0.01,
        child: MaxAdView(
            adUnitId: AppLovinAdManager.getBannerAdUnitID(),
            adFormat: AdFormat.banner,
            isAutoRefreshEnabled: false,
            listener: AdViewAdListener(onAdLoadedCallback: (ad) {
              debugPrint('AppLovin BannerAd Loaded : $ad');
              setState(() {
                isBannerAdLoaded = true;
              });
            }, onAdLoadFailedCallback: (adUnitId, error) {
              debugPrint(
                  'AppLovin BannerAd onFailed : ${error.message} : ${error.code}');
              setState(() {
                isBannerAdLoaded = false;
              });
            }, onAdClickedCallback: (ad) {
              debugPrint('AppLovin BannerAd Clicked');
            }, onAdExpandedCallback: (ad) {
              debugPrint('AppLovin BannerAd Expanded');
            }, onAdCollapsedCallback: (ad) {
              debugPrint('AppLovin BannerAd Collapsed');
            }, onAdRevenuePaidCallback: (ad) {
              debugPrint('AppLovin BannerAd Revenue Called');
            })));
  }
}
