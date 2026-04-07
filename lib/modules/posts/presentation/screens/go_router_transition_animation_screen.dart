import 'package:flutter/material.dart';

class GoRouterTransitionAnimationScreen extends StatelessWidget {
  GoRouterTransitionAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transition Animation'),),
      body: Center(child: Text('Transition Animation', style: TextStyle(fontSize: 30),)),
    );
  }
}
