import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransitionPaint extends CustomPainter {
  final Paint transitonPaint;
  final Animation<double> animationTrans;
  TransitionPaint({Animation animation})
      : transitonPaint = Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill,
        animationTrans = CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        ),
        super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    _drawTransition(canvas, size);
  }

  void _drawTransition(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height);
    path.quadraticBezierTo(
      lerpDouble(size.width, size.width / 2, animationTrans.value),
      lerpDouble(size.height, size.height / 1.5, animationTrans.value),
      lerpDouble(size.width, size.width / 2, animationTrans.value),
      lerpDouble(size.height, 0, animationTrans.value),
    );
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, transitonPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
