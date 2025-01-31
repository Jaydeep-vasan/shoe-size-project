import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimarySlider extends StatelessWidget {
  const PrimarySlider(
      {super.key,
      required this.value,
      required this.min,
      required this.max,
      required this.onChange});

  final double value;
  final double min;
  final double max;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData(trackHeight: 2.0),
        child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChange,
            activeColor: AppColors.gray,
            inactiveColor: AppColors.gray,
            thumbColor: AppColors.sliderActive));
  }
}
