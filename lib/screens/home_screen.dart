import 'package:custom_transition_001/model/transition_model.dart';
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
          final model = Provider.of<TransitionModel>(context);
        },
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [],
      ),
    );
  }
}
