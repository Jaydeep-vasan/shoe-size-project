import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/widgets/button/secondary_button_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryDialogWithMultipleActionsWidget extends StatefulWidget {
  const PrimaryDialogWithMultipleActionsWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.disclaimerWarning,
      required this.onFirstTap,
      required this.onSecondTap});

  final String title;
  final String message;
  final String disclaimerWarning;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  @override
  State<PrimaryDialogWithMultipleActionsWidget> createState() =>
      _PrimaryDialogWithMultipleActionsWidgetState();
}

class _PrimaryDialogWithMultipleActionsWidgetState
    extends State<PrimaryDialogWithMultipleActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryBoldTextWidget(
                    title: widget.title,
                    textAlign: TextAlign.center,
                    boldTextType: BoldTextType.bold20,
                    color: AppColors.darkText),
                SizedBox(height: 8.h),
                PrimaryNormalTextWidget(
                    title: widget.message,
                    textAlign: TextAlign.center,
                    normalTextType: NormalTextType.normal16,
                    color: AppColors.text),
                Visibility(
                    visible: widget.disclaimerWarning.isNotEmpty,
                    child: PrimaryNormalTextWidget(
                            textAlign: TextAlign.center,
                            title: widget.disclaimerWarning,
                            normalTextType: NormalTextType.normal16,
                            color: AppColors.error)
                        .marginOnly(top: 16.h)),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: SecondaryButtonWidget(
                            color: AppColors.white,
                            textColor: AppColors.darkText,
                            borderWidth: 1.w,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                            title: AppStrings.strCancel.tr)),
                    SizedBox(width: 8.w),
                    Expanded(
                        flex: 3,
                        child: SecondaryButtonWidget(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);

                              widget.onFirstTap();
                            },
                            title: AppStrings.strUpdateApp.tr)),
                    SizedBox(width: 8.w),
                    Expanded(
                        flex: 2,
                        child: SecondaryButtonWidget(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);

                              widget.onSecondTap();
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
