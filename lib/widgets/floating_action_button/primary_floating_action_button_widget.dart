import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryFloatingActionButtonWidget extends StatelessWidget {
  const PrimaryFloatingActionButtonWidget(
      {required this.onPressed, this.icon = Icons.add, super.key});

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const CircleBorder(side: BorderSide(color: AppColors.primary)),
        onPressed: onPressed,
        backgroundColor: AppColors.primary,
        child: Icon(icon, color: AppColors.white)).marginOnly(bottom: 70.h);
  }
}
