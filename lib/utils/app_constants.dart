import 'dart:io';

class AppConstants {
  static const String mulishFonts = 'Mulish';

  // Remote config keys
  static const String keyForceUpdateBuildNumber = 'force_update_build_number';
  static const String keyForceUpdateBuildNumberIOS = 'force_update_build_number_ios';

  // Admob Ad Ids
  static const String keyAdMobBannerAdAndroid = 'admob_banner_ad_android';
  static const String keyAdMobBannerAdIOS = 'admob_banner_ad_ios';
  static const String keyAdMobInterstitialAdAndroid = 'admob_interstitial_ad_android';
  static const String keyAdMobInterstitialAdIOS = 'admob_interstitial_ad_ios';
  static const String keyMaxAdmobAdsCount = 'admob_max_ads_per_hour';
  static const String keyMaxAdmobAdsCountIOS = 'admob_max_ads_per_hour_ios';
  static const String keyMaxAdmobInterstitialAdsCount = 'admob_max_interstitial_ads_per_hour';
  static const String keyMaxAdmobInterstitialAdsCountIOS = 'admob_max_interstitial_ads_per_hour_ios';
  static const String keyMaxAdmobNativeAdsCount = 'admob_max_native_ads_per_hour';
  static const String keyMaxAdmobNativeAdsCountIOS = 'admob_max_native_ads_per_hour_ios';
  static const String keyAdMobNativeAdAndroid = 'admob_native_ad_android';
  static const String keyAdMobNativeAdIOS = 'admob_native_ad_ios';

  // Applovin Ad Ids
  static const String keyAppLovinBannerAdAndroid = 'applovin_banner_ad_android';
  static const String keyAppLovinBannerAdIOS = 'applovin_banner_ad_ios';
  static const String keyAppLovinInterstitialAdAndroid =
      'applovin_interstitial_ad_android';
  static const String keyAppLovinInterstitialAdIOS =
      'applovin_interstitial_ad_ios';
  static const String keyMaxAppLovinAdsCount = 'applovin_max_ads_per_hour';
  static const String keyMaxAppLovinAdsCountIOS =
      'applovin_max_ads_per_hour_ios';
  static const String keyMaxAppLovinInterstitialAdsCount =
      'applovin_max_interstitial_ads_per_hour';
  static const String keyMaxAppLovinInterstitialAdsCountIOS =
      'applovin_max_interstitial_ads_per_hour_ios';
  static const String keyMaxAppLovinNativeAdsCount =
      'applovin_max_native_ads_per_hour';
  static const String keyMaxAppLovinNativeAdsCountIOS =
      'applovin_max_native_ads_per_hour_ios';
  static const String keyAppLovinNativeAdAndroid = 'applovin_native_ad_android';
  static const String keyAppLovinNativeAdIOS = 'applovin_native_ad_ios';

  // FB Ad Ids
  static const String keyFBBannerAdAndroid = 'fb_banner_ad_android';
  static const String keyFBBannerAdIOS = 'fb_banner_ad_ios';
  static const String keyFBInterstitialAdAndroid = 'fb_interstitial_ad_android';
  static const String keyFBInterstitialAdIOS = 'fb_interstitial_ad_ios';
  static const String keyMaxFbAdsCount = 'fb_max_ads_per_hour';
  static const String keyMaxFbAdsCountIOS = 'fb_max_ads_per_hour_ios';
  static const String keyMaxFbInterstitialAdsCount = 'fb_max_interstitial_ads_per_hour';
  static const String keyMaxFbInterstitialAdsCountIOS = 'fb_max_interstitial_ads_per_hour_ios';
  static const String keyMaxFbNativeAdsCount = 'fb_max_native_ads_per_hour';
  static const String keyMaxFbNativeAdsCountIOS = 'fb_max_native_ads_per_hour_ios';
  static const String keyFBNativeAdAndroid = 'fb_native_ad_android';
  static const String keyFBNativeAdIOS = 'fb_native_ad_ios';

  // Unity Ad Ids
  static const String keyUnityBannerAdAndroid = 'unity_banner_ad_android';
  static const String keyUnityBannerAdIOS = 'unity_banner_ad_ios';
  static const String keyUnityInterstitialAdAndroid = 'unity_interstitial_ad_android';
  static const String keyUnityInterstitialAdIOS = 'unity_interstitial_ad_ios';
  static const String keyMaxUnityAdsCount = 'unity_max_ads_per_hour';
  static const String keyMaxUnityAdsCountIOS = 'unity_max_ads_per_hour_ios';
  static const String keyMaxUnityInterstitialAdsCount = 'unity_max_interstitial_ads_per_hour';
  static const String keyMaxUnityInterstitialAdsCountIOS = 'unity_max_interstitial_ads_per_hour_ios';

  // static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  // Preference Keys
  static const String prefKeyLanguageCode = 'prefKeyLanguageCode';

  static const String displayDateFormat = 'dd MMM yyyy';
  static const String displayPurchaseDateFormat = 'dd MMM yyyy, hh:mm a';
  static const String ddMMyyyyDateFormat = 'dd-MM-yyyy';
  static const int debounceDuration = 500;
  static const int maxSearchInputLimit = 100;
  static const double trainSpeedPerHour = (33 / 60); // 33 km per hour

  static const String platformAndroid = 'android';
  static const String platformIOS = 'ios';
  static const String packageName = 'com.toastguyz.agra_metro';
  static const String bundleIdentifier = 'com.toastguyz.agra_metro';
  static const String playStoreURL =
      'https://play.google.com/store/apps/details?id=$packageName';
  static const String appStoreURL =
      'https://play.google.com/store/apps/details?id=$bundleIdentifier';
  static final String playStoreOrAppStoreURL =
      Platform.isAndroid ? playStoreURL : appStoreURL;
  static const String websiteURL = 'https://www.toastguyz.com';
  static const String youtubeURL = 'https://www.youtube.com/toastguyz';
  static const String facebookURL = 'https://www.facebook.com/toastguyz';
  static const String moreAppsURL =
      'https://play.google.com/store/apps/developer?id=Toastguyz';

}
