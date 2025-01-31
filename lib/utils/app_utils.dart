import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_colors.dart';

class AppUtils {
  static void displayToast(
      {required String msg,
      Toast toastLength = Toast.LENGTH_SHORT,
      Color? toastColor}) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: toastColor ?? AppColors.primaryDark,
        textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.sp);
  }

  static void launchURL({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint('launchURL : $url');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint('launchURL error: ${e.toString()}');
    }
  }

  static Future<void> openEmailApp({required String email}) async {
    try {
      final Uri launchUri = Uri(scheme: 'mailto', path: email);
      debugPrint(email);
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      }
    } catch (e) {
      debugPrint('openEmailApp error: ${e.toString()}');
    }
  }

  static Future<void> launchWhatsapp(
      {required String countryCode,
      required String mobileNumber,
      String? message}) async {
    try {
      Uri uri = Uri.parse('whatsapp://send?phone=+$countryCode$mobileNumber');
      if (message != null) {
        uri = uri.replace(queryParameters: {'text': Uri.encodeFull(message)});
      }

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint('launchWhatsapp error: ${e.toString()}');
    }
  }

  static void showBottomSheet(
      {required Widget bottomSheetWidget, bool isScrollControlled = false}) {
    Get.bottomSheet(bottomSheetWidget,
        isScrollControlled: isScrollControlled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        backgroundColor: AppColors.white,
        isDismissible: true);
  }
}
