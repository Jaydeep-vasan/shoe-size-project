import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimarySwitchWidget extends StatelessWidget {
  const PrimarySwitchWidget(
      {required this.isSelected, required this.onChanged, super.key});

  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
        value: isSelected,
        onChanged: (bool? value) {
          onChanged!(value);
        },
        activeColor: AppColors.primary,
        inactiveTrackColor: AppColors.secondaryLight);
  }
}
