import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryCheckBoxWidget extends StatelessWidget {
  const PrimaryCheckBoxWidget(
      {required this.isSelected, required this.onChanged, super.key});

  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 20.h,
      child: Checkbox(
        activeColor: AppColors.primary,
        checkColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: AppColors.primaryDark)),
        value: isSelected,
        onChanged: (bool? value) {
          onChanged!(value);
        },
      ),
    );
  }
}
