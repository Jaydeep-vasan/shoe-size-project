import 'package:flutter/material.dart';
import 'package:shoe_size/widgets/dash_line/dash_line_painter.dart';

class DottedDashedLineWidget extends StatelessWidget {
  final double height;
  final double width;
  final Axis axis;
  final double dashHeight;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Color dashColor;

  // For Horizontal dash line declare width > 0 and height can be 0.
  // For Vertical dash line declare height > 0 and width can be 0.
  const DottedDashedLineWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.axis,
      this.dashHeight = 5,
      this.dashWidth = 5,
      this.dashSpace = 3,
      this.strokeWidth = 1,
      this.dashColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(width, height),
        painter: DashLinePainter(
            axis: axis,
            dashHeight: dashHeight,
            dashWidth: dashWidth,
            dashSpace: dashSpace,
            dashColor: dashColor,
            strokeWidth: strokeWidth));
  }
}
