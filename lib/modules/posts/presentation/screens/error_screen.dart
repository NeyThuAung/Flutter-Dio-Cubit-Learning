import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Screen")),
      body: Center(
        child: Text('This is error screen', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
