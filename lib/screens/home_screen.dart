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
  @override
  void initState() {
    super.initState();
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
