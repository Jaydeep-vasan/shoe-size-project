import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/admob_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobBannerAdsWidget extends StatefulWidget {
  const AdMobBannerAdsWidget({super.key});

  @override
  State<AdMobBannerAdsWidget> createState() => _AdMobBannerAdsWidgetState();
}

class _AdMobBannerAdsWidgetState extends State<AdMobBannerAdsWidget> {
  BannerAd? anchoredAdaptiveBannerAd;
  bool isBannerAdLoaded = false;

  Future<void> loadBannerAd() async {
    debugPrint('Admob BannerAd Called.');
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      return;
    }

    anchoredAdaptiveBannerAd = BannerAd(
      adUnitId: AdMobManager.getBannerAdUnitID(),
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('Admob BannerAd Loaded : ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            anchoredAdaptiveBannerAd = ad as BannerAd;
            isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Admob BannerAd onFailed : $error');
          ad.dispose();
        },
      ),
    );
    return anchoredAdaptiveBannerAd?.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (AdMobManager.getBannerAdUnitID().isNotEmpty) {
      loadBannerAd();
    }
  }

  @override
  void dispose() {
    anchoredAdaptiveBannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return anchoredAdaptiveBannerAd != null && isBannerAdLoaded
        ? SizedBox(
            width: anchoredAdaptiveBannerAd?.size.width.toDouble(),
            height: anchoredAdaptiveBannerAd?.size.height.toDouble(),
            child: AdWidget(ad: anchoredAdaptiveBannerAd!))
        : const SizedBox();
  }
}
