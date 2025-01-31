import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/widgets/button/primary_button_widget.dart';
import 'package:shoe_size/widgets/button/primary_ouline_button_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryDialogWidget extends StatefulWidget {
  const PrimaryDialogWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.disclaimerWarning,
      required this.onTap});

  final String title;
  final String message;
  final String disclaimerWarning;
  final VoidCallback onTap;

  @override
  State<PrimaryDialogWidget> createState() => _PrimaryDialogWidgetState();
}

class _PrimaryDialogWidgetState extends State<PrimaryDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryBoldTextWidget(
                    title: widget.title,
                    boldTextType: BoldTextType.bold20,
                    color: AppColors.darkText),
                SizedBox(height: 8.h),
                PrimaryNormalTextWidget(
                    title: widget.message,
                    normalTextType: NormalTextType.normal16,
                    color: AppColors.text),
                Visibility(
                    visible: widget.disclaimerWarning.isNotEmpty,
                    child: PrimaryNormalTextWidget(
                            title: widget.disclaimerWarning,
                            normalTextType: NormalTextType.normal16,
                            color: AppColors.error)
                        .marginOnly(top: 16.h)),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                        child: PrimaryOutlineButtonWidget(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                            title: AppStrings.strCancel.tr)),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: PrimaryButtonWidget(
                            borderRadius: 32,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);

                              widget.onTap();
                            },
                            title: AppStrings.strOk.tr)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
