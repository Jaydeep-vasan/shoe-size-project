import 'package:shoe_size/widgets/button/primary_button_widget.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryDialogWidget extends StatefulWidget {
  const SecondaryDialogWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.buttonText,
      required this.onTap});

  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onTap;

  @override
  State<SecondaryDialogWidget> createState() => _SecondaryDialogWidgetState();
}

class _SecondaryDialogWidgetState extends State<SecondaryDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  textAlign: TextAlign.center,
                  boldTextType: BoldTextType.bold20,
                  color: AppColors.darkText),
              SizedBox(height: 16.h),
              PrimaryNormalTextWidget(
                  title: widget.message,
                  normalTextType: NormalTextType.normal14,
                  color: AppColors.text),
              SizedBox(height: 20.h),
              PrimaryButtonWidget(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  borderRadius: 32,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);

                    widget.onTap();
                  },
                  title: widget.buttonText),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
