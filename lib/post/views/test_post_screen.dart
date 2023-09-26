import 'package:flutter/material.dart';

class TestHomeScreen extends StatelessWidget {
  static const routeName = "home";
  static const routeURL = "/home";
  const TestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }
}
