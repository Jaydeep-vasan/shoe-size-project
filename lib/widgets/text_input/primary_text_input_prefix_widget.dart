import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextInputPrefixWidget extends StatefulWidget {
  final bool enabled;
  final IconData icon;
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;

  const PrimaryTextInputPrefixWidget(
      {super.key,
      required this.textController,
      required this.icon,
      this.inputFormatters,
      this.enabled = true,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next});

  @override
  State<PrimaryTextInputPrefixWidget> createState() =>
      _PrimaryTextInputPrefixWidgetState();
}

class _PrimaryTextInputPrefixWidgetState
    extends State<PrimaryTextInputPrefixWidget> {
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
        decoration: InputDecoration(
            fillColor: AppColors.textInputFill,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: AppColors.gray,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(widget.icon, color: AppColors.darkText),
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
