import 'package:shoe_size/app_provider.dart';
import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/admob_manager.dart';
import 'package:shoe_size/utils/app_enums.dart';
import 'package:shoe_size/utils/applovin_ad_manager.dart';
import 'package:shoe_size/utils/fb_ad_manager.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdUtils {
  // Combo of Admob & Unity Interstitial Ad Load
  static void showType1InterstitialAdsWidget() {
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    AppProvider appProvider = Provider.of<AppProvider>(Get.context!, listen: false);
    // A map of ad networks and their corresponding "can show" checks.
    final Map<Type1AdNetworks, bool Function()> adNetworkConditions = {
      Type1AdNetworks.admob: appProvider.canShowAdMobInterstitialAd,
      Type1AdNetworks.fb: appProvider.canShowFbInterstitialAd,
      Type1AdNetworks.applovin: appProvider.canShowAppLovinInterstitialAd
    };

    // Get the index of the last shown ad network.
    int lastShownIndex = adNetworkOrder.indexOf(appProvider.type1LastShownInterstitialAdNetwork);

    for (int i = 1; i <= adNetworkOrder.length; i++) {
      int currentIndex = (lastShownIndex + i) % adNetworkOrder.length;
      Type1AdNetworks currentNetwork = adNetworkOrder[currentIndex];

      // Check if the current network can show ads.
      if (adNetworkConditions[currentNetwork]?.call() ?? false) {
        // Update the last shown ad network.
        appProvider.showInterstitialAdNetwork(currentNetwork);

        // Return the widget for the current ad network.
        switch (currentNetwork) {
          case Type1AdNetworks.admob:
            AdMobManager.loadInterstitialAd();
            break;
          case Type1AdNetworks.fb:
            FbAdManager.loadInterstitialAd();
            break;
          case Type1AdNetworks.applovin:
            AppLovinAdManager.loadInterstitialAd();
            break;
        }

        // Break the loop after showing the ad
        break;
      }
    }
  }
}