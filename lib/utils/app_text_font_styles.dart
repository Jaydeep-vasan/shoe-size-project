import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextFontStyles {
  // Regular font size : fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.33
  static final black12Normal = Get.textTheme.bodySmall;

  // Medium font size : fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.33
  static final black12Medium = Get.textTheme.labelMedium?.copyWith(fontSize: 12.sp, height: 1.25, fontWeight: FontWeight.w500);

  // Semibold font size : fontSize: 12.0, fontWeight: FontWeight.w600, letterSpacing: 0.5, height: 1.33
  static final black12SemiBold = Get.textTheme.headlineLarge?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);

  // Bold font size : fontSize: 12.0, fontWeight: FontWeight.w700, letterSpacing: 0.5, height: 1.33
  static final black12Bold = Get.textTheme.titleLarge?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold);
}
