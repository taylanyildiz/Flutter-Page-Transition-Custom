import 'package:flutter/material.dart';

class CustomTransitionPainterButton extends CustomPainter {
  final Paint buttonPaint;
  final Color buttonColor;

  CustomTransitionPainterButton({
    this.buttonColor,
  })  : buttonPaint = Paint()
          ..color = buttonColor ?? Colors.red
          ..style = PaintingStyle.fill,
        super();
  @override
  void paint(Canvas canvas, Size size) {
    _drawButtonPaint(canvas, size);
  }

  void _drawButtonPaint(Canvas canvas, Size size) {
    canvas.drawCircle(size.center(Offset.zero), 40.0, buttonPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
