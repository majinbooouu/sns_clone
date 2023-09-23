import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const routeName = "test";
  static const routeURL = "/test";
  const TestScreen({super.key});

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
