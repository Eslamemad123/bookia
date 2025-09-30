import 'dart:ui';

import 'package:flutter/material.dart';

class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 1.5;

    canvas.drawLine(
      Offset(-3, 10), // من أعلى يسار
      Offset(size.width + 3, size.height - 10), // لأسفل يمين
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
