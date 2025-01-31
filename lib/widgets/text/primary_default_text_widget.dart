import 'package:flutter/material.dart';
import 'package:shoe_size/utils/app_text_font_styles.dart';

class PrimaryDefaultTextWidget extends StatelessWidget {
  const PrimaryDefaultTextWidget(
      {super.key,
      required this.title,
      required this.textStyle,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.height,
      this.textDirection,
      this.maxLines,
      this.shadows,
      this.textAlign = TextAlign.start,
      this.overflow,
      this.decorationColor});
  final String title;
  final TextStyle? textStyle;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final int? maxLines;
  final List<Shadow>? shadows;
  final TextOverflow? overflow;

  TextStyle? _buildStyle() {
    TextStyle? defaultTextStyle = textStyle ?? AppTextFontStyles.black12Normal;
    if (color != null) {
      defaultTextStyle = defaultTextStyle?.copyWith(color: color);
    }
    if (fontSize != null) {
      defaultTextStyle = defaultTextStyle?.copyWith(fontSize: fontSize);
    }
    if (fontWeight != null) {
      defaultTextStyle = defaultTextStyle?.copyWith(fontWeight: fontWeight);
    }
    if (letterSpacing != null) {
      defaultTextStyle =
          defaultTextStyle?.copyWith(letterSpacing: letterSpacing);
    }
    if (height != null) {
      defaultTextStyle = defaultTextStyle?.copyWith(height: height);
    }
    if (shadows != null) {
      defaultTextStyle = defaultTextStyle?.copyWith(shadows: shadows);
    }
    if (decorationColor != null) {
      defaultTextStyle =
          defaultTextStyle?.copyWith(decorationColor: decorationColor);
    }
    return defaultTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        overflow: overflow,
        style: _buildStyle(),
        textDirection: textDirection,
        maxLines: maxLines);
  }
}
