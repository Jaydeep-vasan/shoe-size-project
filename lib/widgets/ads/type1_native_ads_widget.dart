import 'package:shoe_size/app_provider.dart';
import 'package:shoe_size/helper/connection_helper.dart';
import 'package:shoe_size/utils/app_enums.dart';
import 'package:shoe_size/widgets/ads/admob/admob_native_ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/widgets/ads/applovin/applovin_native_ads_widget.dart';
import 'package:shoe_size/widgets/ads/fb/facebook_native_ads_widget.dart';
import 'package:provider/provider.dart';

// Combo of Admob & Unity Native Ad Widget
class Type1NativeAdsWidget extends StatefulWidget {
  const Type1NativeAdsWidget({super.key});

  @override
  State<Type1NativeAdsWidget> createState() => _Type1NativeAdsWidgetState();
}

class _Type1NativeAdsWidgetState extends State<Type1NativeAdsWidget> {
  Type1AdNetworks? selectedAdNetwork;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectAdNetwork();
    });
  }

  void selectAdNetwork() {
    bool isInternetOn = ConnectionHelper().isInterNetAvailable();
    if (!isInternetOn) return;

    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    // Map of ad networks and their corresponding "can show" checks.
    final Map<Type1AdNetworks, bool Function()> adNetworkConditions = {
      Type1AdNetworks.admob: appProvider.canShowAdMobNativeAd,
      Type1AdNetworks.fb: appProvider.canShowFbNativeAd,
      Type1AdNetworks.applovin: appProvider.canShowAppLovinNativeAd,
    };

    // Get the index of the last shown ad network.
    int lastShownIndex = adNetworkOrder.indexOf(appProvider.type1LastShownNativeAdNetwork);

    // Loop through the ad networks in round-robin order.
    for (int i = 1; i <= adNetworkOrder.length; i++) {
      int currentIndex = (lastShownIndex + i) % adNetworkOrder.length;
      Type1AdNetworks currentNetwork = adNetworkOrder[currentIndex];

      // Check if the current network can show ads.
      if (adNetworkConditions[currentNetwork]?.call() ?? false) {
        // Update the last shown ad network in the provider.
        appProvider.showNativeAdNetwork(currentNetwork);

        // Set the selected ad network and exit the loop.
        setState(() {
          selectedAdNetwork = currentNetwork;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedAdNetwork == null) return const SizedBox();

    // Return the widget for the selected ad network.
    switch (selectedAdNetwork) {
      case Type1AdNetworks.admob:
        return const AdMobNativeAdsWidget();
      case Type1AdNetworks.fb:
        return const FacebookNativeAdsWidget();
      case Type1AdNetworks.applovin:
        return const AppLovinNativeAdsWidget();
      default:
        return const SizedBox();
    }
  }
}
