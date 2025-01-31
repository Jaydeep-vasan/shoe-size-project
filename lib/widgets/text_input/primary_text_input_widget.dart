import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextInputWidget extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final Color? disabledColor;
  final String? hintText;

  const PrimaryTextInputWidget(
      {super.key,
      required this.textController,
      this.inputFormatters,
      this.disabledColor,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false});

  @override
  State<PrimaryTextInputWidget> createState() => _PrimaryTextInputWidgetState();
}

class _PrimaryTextInputWidgetState extends State<PrimaryTextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.obscureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        controller: widget.textController,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        cursorColor: AppColors.text,
        style: const TextStyle(color: AppColors.text),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
            fillColor: widget.disabledColor ?? AppColors.textInputFill,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.gray, fontSize: 14.sp, fontWeight: FontWeight.w500),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
