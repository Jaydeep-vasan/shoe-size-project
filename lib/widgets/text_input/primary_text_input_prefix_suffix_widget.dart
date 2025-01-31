import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_typedef.dart';

class PrimaryTextInputPrefixSuffixWidget extends StatefulWidget {
  final bool enabled;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final Color? textInputFillColor;
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final OnChangeCallback? onChanged;
  final String? hintText;

  const PrimaryTextInputPrefixSuffixWidget(
      {super.key,
      required this.textController,
      required this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.hintText,
      this.textInputFillColor,
      this.inputFormatters,
      this.enabled = true,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next});

  @override
  State<PrimaryTextInputPrefixSuffixWidget> createState() =>
      _PrimaryTextInputPrefixSuffixWidgetState();
}

class _PrimaryTextInputPrefixSuffixWidgetState
    extends State<PrimaryTextInputPrefixSuffixWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: widget.enabled,
        controller: widget.textController,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        cursorColor: AppColors.text,
        style: const TextStyle(color: AppColors.text),
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            fillColor: widget.textInputFillColor ?? AppColors.textInputFill,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: AppColors.gray,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(widget.prefixIcon, color: AppColors.darkText),
            suffixIcon: widget.suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textInputBorder),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textInputBorder),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textInputBorder),
                borderRadius: BorderRadius.all(Radius.circular(8)))));
  }
}
