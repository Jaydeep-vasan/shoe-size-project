import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryProgressIndicatorWidget extends StatelessWidget {
  const PrimaryProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)));
  }
}
