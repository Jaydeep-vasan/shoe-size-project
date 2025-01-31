import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/fb_ad_manager.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FacebookBannerAdsWidget extends StatefulWidget {
  const FacebookBannerAdsWidget({this.keepAlive = true, super.key});

  final bool keepAlive;

  @override
  State<FacebookBannerAdsWidget> createState() =>
      _FacebookBannerAdsWidgetState();
}

class _FacebookBannerAdsWidgetState extends State<FacebookBannerAdsWidget> {
  bool isBannerAdLoaded = false;
  Widget bannerAdWidget = const SizedBox();

  void loadBannerAd() {
    debugPrint('FB BannerAd Called.');
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    bannerAdWidget = FacebookBannerAd(
      placementId: FbAdManager.getBannerAdUnitID(),
      bannerSize: BannerSize.STANDARD,
      keepAlive: widget.keepAlive,
      listener: (result, value) {
        debugPrint('FB BannerAd Event Listener : ${result.toString()}');
        switch (result) {
          case BannerAdResult.ERROR:
            debugPrint('FB BannerAd onFailed : $value');
            setState(() {
              bannerAdWidget = const SizedBox();
              isBannerAdLoaded = false;
            });
            break;
          case BannerAdResult.LOADED:
            debugPrint('FB BannerAd Loaded : $value');
            setState(() {
              isBannerAdLoaded = true;
            });
            break;
          case BannerAdResult.CLICKED:
            debugPrint('FB BannerAd Clicked : $value');
            break;
          case BannerAdResult.LOGGING_IMPRESSION:
            debugPrint('FB BannerAd Logging Impression : $value');
            break;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if(FbAdManager.getBannerAdUnitID().isNotEmpty){
      loadBannerAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return bannerAdWidget;
  }
}
