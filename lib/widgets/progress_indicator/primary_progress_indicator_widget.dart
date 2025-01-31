import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';

class PrimaryProgressIndicatorWidget extends StatelessWidget {
  const PrimaryProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)));
  }
}
