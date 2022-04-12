import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(
      {required this.point1,
      required this.point2,
      this.colorOfTheLine = Colors.purple});

  final Offset point1;
  final Offset point2;
  final Color colorOfTheLine;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final linePaint = Paint()
      ..color = colorOfTheLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(point1, point2, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
