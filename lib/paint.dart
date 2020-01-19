import 'dart:math' as math;
import 'package:flutter/material.dart';

///math math
class CirclePainter extends CustomPainter {
  double overallPercent;

  CirclePainter(this.overallPercent);

  @override
  void paint(Canvas canvas, Size size) {
    double circleSize = 25.0;
    double angle = math.pi / 180.0 * ((overallPercent * 360 / 100));
    double line = overallPercent * (size.width - circleSize) / 100;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final path = Path();
    if (overallPercent < 50) {
      path.addPolygon([
        Offset(0.0, size.height),
        Offset((line * 2), size.height),
      ], false);
    }
    if (overallPercent > 50) {
      path.arcTo(
          Rect.fromLTWH(
              size.width - (circleSize * 2), 0.0, circleSize * 2, size.height),
          math.pi / 2,
          -angle * 2,
          false);
      if (overallPercent < 100) {
        path.addPolygon([
          Offset(overallPercent * (size.width - circleSize) / 100, size.height),
          Offset(size.width - circleSize, size.height),
        ], false);
      }
      if (overallPercent == 100) {
        path.addArc(
            Rect.fromLTWH(size.width - (circleSize * 2), 0.0, circleSize * 2,
                size.height),
            math.pi / 2,
            math.pi * 2);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}