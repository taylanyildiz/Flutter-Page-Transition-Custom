import 'package:custom_transition_001/config/transition_paint.dart';
import 'package:custom_transition_001/widgets/widgets.dart';

import '../config/button_paint.dart';
import 'package:flutter/material.dart';

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
  PageController _pageController;
  AnimationController _controller;
  Animation animation;
  Animation secodaryAnimation;
  Animation endAnimation;

  int currentPage = 0;

  final _screens = <Widget>[
    Scaffold(backgroundColor: Colors.blue),
    Scaffold(backgroundColor: Colors.green),
    Scaffold(backgroundColor: Colors.grey),
    Scaffold(backgroundColor: Colors.orange),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween(begin: 40.0, end: 400.0).animate(_controller);
  }

  void nextPage() async {
    _controller.forward();
    currentPage < _screens.length - 1 ? currentPage++ : currentPage = 0;
    if (currentPage != 0)
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    else
      _pageController.jumpToPage(currentPage);
    if (_controller.status == await AnimationStatus.completed) {
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (page) => currentPage = page,
            itemCount: _screens.length,
            itemBuilder: (context, index) => _screens[index],
          ),
          CustomButton(
            onPressed: () => nextPage(),
          ),
          IgnorePointer(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: TransitionPaint(animation: _controller.view),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
