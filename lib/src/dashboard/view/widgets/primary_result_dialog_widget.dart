import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/model/shoe_size_model.dart';
import 'package:shoe_size/src/dashboard/view/widgets/primary_result_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:shoe_size/utils/app_images.dart';
import 'package:shoe_size/widgets/text/primary_bold_text_widget.dart';

class PrimaryResultDialogWidget extends StatelessWidget {
  const PrimaryResultDialogWidget(
      {super.key,
      required this.selectedGenderImagePath,
      required this.selectedShoeSize,
      required this.selectedShoeSizeModel,
      required this.shoeSizeResultList});

  final String selectedGenderImagePath;
  final String selectedShoeSize;
  final ShoeSizeResultModel selectedShoeSizeModel;
  final List<ShoeSizeResultModel> shoeSizeResultList;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                            child: PrimaryBoldTextWidget(
                                title: AppStrings.strShoeSizeConversion.tr,
                                boldTextType: BoldTextType.bold20)),
                        SizedBox(width: 16.w),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.close,
                                size: 32.h, color: AppColors.primaryDark))
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Image.asset(selectedGenderImagePath,
                            height: 28.h, width: 28.h, fit: BoxFit.cover),
                        SizedBox(width: 6.w),
                        Expanded(
                            child: PrimaryBoldTextWidget(
                                title: selectedShoeSize,
                                boldTextType: BoldTextType.bold14))
                      ],
                    ),
                    SizedBox(height: 8.h),
                    PrimaryResultBoxWidget(
                        title: selectedShoeSizeModel.name,
                        subTitle: '${selectedShoeSizeModel.result}',
                        verticalPadding: 16.h),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Image.asset(AppImages.shoe,
                            height: 28.h, width: 28.h, fit: BoxFit.cover),
                        SizedBox(width: 6.w),
                        PrimaryBoldTextWidget(
                            title: AppStrings.strResult.tr,
                            boldTextType: BoldTextType.bold14),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 16.h),
                      itemCount: shoeSizeResultList.length,
                      itemBuilder: (context, index) {
                        final item = shoeSizeResultList[index];

                        return PrimaryResultBoxWidget(
                            title: item.name, subTitle: '${item.result}');
                      },
                    ),
                    SizedBox(height: 16.h),
                  ]).paddingSymmetric(horizontal: 20.w, vertical: 16.h))
        ]).paddingSymmetric(horizontal: 24.w, vertical: 16.h);
  }
}
