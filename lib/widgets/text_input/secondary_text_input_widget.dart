import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryTextInputWidget extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final String? hintText;
  final Color? disabledColor;
  final Widget? suffixIcon;

  const SecondaryTextInputWidget(
      {super.key,
      required this.textController,
      this.maxLines,
      this.inputFormatters,
      this.disabledColor,
      this.hintText,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false});

  @override
  State<SecondaryTextInputWidget> createState() =>
      _SecondaryTextInputWidgetState();
}

class _SecondaryTextInputWidgetState extends State<SecondaryTextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.h,
        child: TextFormField(
            obscureText: widget.obscureText,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            controller: widget.textController,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            cursorColor: AppColors.text,
            style: const TextStyle(color: AppColors.text),
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: AppColors.gray,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                fillColor: widget.disabledColor ?? AppColors.textInputFill,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textInputBorder),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textInputBorder),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textInputBorder),
                    borderRadius: BorderRadius.all(Radius.circular(8))))));
  }
}
