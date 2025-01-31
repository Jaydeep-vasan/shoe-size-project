import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/fb_ad_manager.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FacebookNativeAdsWidget extends StatefulWidget {
  const FacebookNativeAdsWidget({this.keepAlive = true, super.key});

  final bool keepAlive;

  @override
  State<FacebookNativeAdsWidget> createState() =>
      _FacebookNativeAdsWidgetState();
}

class _FacebookNativeAdsWidgetState extends State<FacebookNativeAdsWidget> {
  double nativeAdHeight = 300.h;
  bool isNativeAdLoaded = false;
  Widget nativeAdWidget = const SizedBox();

  void loadNativeAd() {
    debugPrint('FB NativeAd Called.');
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    nativeAdWidget = FacebookNativeAd(
      placementId: FbAdManager.getNativeAdUnitID(),
      adType: NativeAdType.NATIVE_AD,
      width: double.infinity,
      height: nativeAdHeight,
      backgroundColor: AppColors.adBlue,
      titleColor: AppColors.white,
      descriptionColor: AppColors.white,
      buttonColor: AppColors.adPurple,
      buttonTitleColor: AppColors.white,
      buttonBorderColor: AppColors.white,
      // Set true if you do not want adview to refresh on widget rebuild
      keepAlive: widget.keepAlive,
      listener: (result, value) {
        debugPrint('Admob NativeAd Event Listener : ${result.toString()}');
        switch (result) {
          case NativeAdResult.ERROR:
            debugPrint('FB NativeAd onFailed : $value');
            setState(() {
              nativeAdWidget = const SizedBox();
              isNativeAdLoaded = false;
            });

            break;
          case NativeAdResult.LOADED:
            debugPrint('FB NativeAd Loaded : $value');
            setState(() {
              isNativeAdLoaded = true;
            });

            break;
          case NativeAdResult.CLICKED:
            debugPrint('FB NativeAd Clicked : $value');
            break;
          case NativeAdResult.LOGGING_IMPRESSION:
            debugPrint('FB NativeAd Logging Impression : $value');
            break;
          case NativeAdResult.MEDIA_DOWNLOADED:
            debugPrint('FB NativeAd Media Download Success : $value');
            break;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (FbAdManager.getNativeAdUnitID().isNotEmpty) {
      loadNativeAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return nativeAdWidget;
  }
}
