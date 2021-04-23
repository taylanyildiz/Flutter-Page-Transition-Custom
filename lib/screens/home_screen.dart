import 'package:custom_transition_001/config/palette.dart';
import 'package:custom_transition_001/model/transition_model.dart';
import 'package:custom_transition_001/widgets/animated_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation startAnimation;
  Animation endAnimation;
  Animation horizontalAnimation;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    startAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(.0, .5, curve: Curves.easeInExpo),
    );
    endAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(.5, 1.0, curve: Curves.easeOutExpo),
    );
    horizontalAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(.75, 1.0, curve: Curves.easeInOutQuad),
    );

    animationController
      ..addStatusListener(
        (status) {
          final model = Provider.of<TransitionModel>(context, listen: false);
          if (status == AnimationStatus.completed) {
            model.swapColors();
            animationController.reset();
          }
        },
      )
      ..addListener(() {
        final model = Provider.of<TransitionModel>(context, listen: false);
        if (animationController.value > .5) {
          model.isHalfWay = true;
        } else {
          model.isHalfWay = false;
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TransitionModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
      body: Stack(
        children: [
          Container(
            color:
                model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
            width: width / 2.0 - Palette.radius / 2.0,
            height: double.infinity,
          ),
          Transform(
            transform: Matrix4.identity()
              ..translate(
                width / 2.0 - Palette.radius / 2.0,
                height - Palette.radius - Palette.bottomPadding,
              ),
            child: GestureDetector(
              onTap: () {
                if (animationController.status != AnimationStatus.forward) {
                  model.isToggled = !model.isToggled;
                  model.index++;
                  if (model.index > 3) {
                    model.index = 0;
                  }
                  pageController.animateToPage(
                    model.index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuad,
                  );
                  animationController.forward();
                }
              },
              child: Stack(
                children: [
                  AnimatedCircleButton(
                    animation: startAnimation,
                    color: model.foreGroundColor,
                    flip: 1.0,
                    tween: Tween<double>(begin: 1.0, end: Palette.radius),
                  ),
                  AnimatedCircleButton(
                    animation: endAnimation,
                    color: model.backGroundColor,
                    flip: -1.0,
                    horizontalTween:
                        Tween<double>(begin: 0.0, end: -Palette.radius),
                    horizontalAnimation: horizontalAnimation,
                    tween: Tween<double>(begin: Palette.radius, end: 1.0),
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: PageView.builder(
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, index) => Center(
                child: Text(
                  '${index + 1} Page',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: index % 2 == 0 ? Palette.mediumBlue : Palette.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
