import 'package:custom_transition_001/config/palette.dart';
import 'package:custom_transition_001/model/transition_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedCircleButton extends AnimatedWidget {
  final Animation<double> animation;
  final Animation<double> horizontalAnimation;
  final Color color;
  final double flip;
  final Tween<double> tween;
  final Tween<double> horizontalTween;

  AnimatedCircleButton({
    Key key,
    @required this.animation,
    this.horizontalAnimation,
    this.horizontalTween,
    @required this.color,
    @required this.flip,
    @required this.tween,
  })  : assert(flip == 1 || flip == -1),
        super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TransitionModel>(context, listen: true);
    return Transform(
      alignment: FractionalOffset.centerLeft,
      transform: Matrix4.identity()
        ..scale(
          tween.evaluate(animation) * flip,
          tween.evaluate(animation),
        ),
      child: Transform(
        transform: Matrix4.identity()
          ..translate(
            horizontalTween != null
                ? horizontalTween.evaluate(horizontalAnimation)
                : 0.0,
          ),
        child: Container(
          width: Palette.radius,
          height: Palette.radius,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              Palette.radius / 2.0 -
                  tween.evaluate(animation) / (Palette.radius / 2.0),
            ),
          ),
          child: Icon(
            flip == 1 ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
            color: model.index % 2 == 0 ? Palette.white : Palette.mediumBlue,
          ),
        ),
      ),
    );
  }
}
