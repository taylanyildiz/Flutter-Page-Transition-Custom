import '../config/button_paint.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.0,
      child: InkWell(
        onTap: onPressed,
        child: CustomPaint(
          painter: CustomTransitionPainterButton(),
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
