import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryBackButtonWidget extends StatelessWidget {
  const PrimaryBackButtonWidget({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
        onTap: () => onTap ?? Get.back());
  }
}
