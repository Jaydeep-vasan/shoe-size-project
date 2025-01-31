import 'package:shoe_size/extensions/app_extensions.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/widgets/dropdown/dropdown_button2.dart';
import 'package:shoe_size/widgets/text/primary_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class GenericDropdownItem {
  String get displayText;

  String get id;
}

class GenericDropdownWidget<T extends GenericDropdownItem>
    extends StatefulWidget {
  const GenericDropdownWidget(
      {super.key,
      required this.items,
      this.selectedValue,
      this.onChange,
      this.offset,
      this.dropdownElevation,
      this.scrollbarRadius,
      this.scrollbarThickness,
      this.scrollbarAlwaysShow,
      this.dropdownHeight,
      this.dropdownWidth,
      this.dropdownPadding,
      this.dropdownDecoration,
      this.buttonHeight,
      this.buttonWidth,
      this.buttonPadding,
      this.buttonDecoration,
      this.buttonElevation,
      this.icon,
      this.iconSize,
      this.iconEnabledColor,
      this.iconDisabledColor,
      this.itemHeight,
      this.itemPadding,
      this.hintAlignment,
      this.valueAlignment,
      this.selectedItemBuilder,
      this.textColor,
      this.titleHint,
      this.buttonFillColor,
      this.dropdownFillColor});

  final T? selectedValue;
  final List<T> items;
  final ValueChanged<GenericDropdownItem>? onChange;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final DropdownButtonBuilder? selectedItemBuilder;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? textColor;
  final Color? iconDisabledColor;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final String? titleHint;
  final Color? buttonFillColor;
  final Color? dropdownFillColor;

  @override
  State<GenericDropdownWidget> createState() => _GenericDropdownWidgetState();
}

class _GenericDropdownWidgetState<T extends GenericDropdownItem>
    extends State<GenericDropdownWidget> {
  GenericDropdownItem? dropdownValue;

  @override
  void initState() {
    super.initState();
    setSelectedValue();
  }

  @override
  void didUpdateWidget(
      covariant GenericDropdownWidget<GenericDropdownItem> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setSelectedValue();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
            isExpanded: true,
            isDense: true,
            value: dropdownValue?.displayText,
            hint: buildDropdownTextWidget(
                title: widget.titleHint ?? AppStrings.strSelectDropdown.tr,
                textColor: AppColors.darkText.withOpacity(0.5)),
            items: widget.items.map(
              (value) {
                return DropdownMenuItem<String>(
                    value: value.displayText,
                    child: buildDropdownTextWidget(
                        title: value.displayText,
                        textColor: widget.textColor ?? AppColors.dropdownText));
              },
            ).toList(),
            onChanged: (value) {
              if (widget.onChange != null) {
                dynamic selectedItem = widget.items
                    .where((element) => element.displayText == value);
                if (selectedItem.isNotEmpty) {
                  widget.onChange!(selectedItem.first);
                  setState(() {
                    dropdownValue = selectedItem.first;
                  });
                }
              }
            },
            selectedItemBuilder: widget.selectedItemBuilder,
            iconEnabledColor: widget.iconEnabledColor ?? AppColors.dropdownText,
            icon: widget.icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
            iconDisabledColor: widget.iconDisabledColor,
            buttonElevation: widget.buttonElevation,

            // Configurable dropdown property items.
            buttonWidth: widget.buttonWidth ?? 140,
            buttonHeight: widget.buttonHeight ?? 48.h,
            buttonPadding: widget.buttonPadding ??
                EdgeInsets.only(left: 14.w, right: 14.w, top: 8.h, bottom: 8.h),
            iconSize: widget.iconSize ?? 24.h,
            itemHeight: widget.itemHeight ?? 45.h,
            itemPadding: widget.itemPadding ??
                EdgeInsets.only(left: 14.w, right: 14.w, top: 8.h, bottom: 8.h),
            buttonDecoration: widget.buttonDecoration ??
                BoxDecoration(
                    color: widget.buttonFillColor ?? AppColors.dropdownFill,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.dropdownBorder)),
            dropdownDecoration: widget.dropdownDecoration ??
                BoxDecoration(
                    color: widget.dropdownFillColor ?? AppColors.dropdownFill,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.dropdownBorder)),

            /// Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
            dropdownMaxHeight: widget.dropdownHeight ?? 300,
            dropdownWidth: widget.dropdownWidth ?? 140,
            dropdownPadding: widget.dropdownPadding,
            dropdownElevation: widget.dropdownElevation ?? 8,
            scrollbarRadius:
                widget.scrollbarRadius ?? const Radius.circular(40),
            scrollbarThickness: widget.scrollbarThickness,
            scrollbarAlwaysShow: widget.scrollbarAlwaysShow,

            /// Null or Offset(0, 0) will open just under the button. You can edit as you want.
            offset: widget.offset,
            dropdownOverButton: false));
  }

  Widget buildDropdownTextWidget({required String title, Color? textColor}) {
    return PrimaryNormalTextWidget(
        title: title,
        normalTextType: NormalTextType.normal14,
        color: textColor ?? AppColors.dropdownText);
  }

  void setSelectedValue() {
    if (widget.items.isNotEmpty &&
        widget.selectedValue != null &&
        !widget.selectedValue!.displayText.isNullOrEmpty()) {
      dropdownValue = widget.selectedValue;
    } else {
      dropdownValue = null;
    }
  }
}
