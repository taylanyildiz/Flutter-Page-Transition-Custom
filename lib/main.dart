import 'package:custom_transition_001/model/transition_model.dart';
import 'package:custom_transition_001/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransitionModel(),
      child: MaterialApp(
        title: 'Page Transition',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(title: 'Page Transition Demo'),
      ),
    );
  }
}
