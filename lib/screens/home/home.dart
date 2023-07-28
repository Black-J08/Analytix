import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix"),
      ),
      body: Text(
        "Home",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 40,
        ),
      ),
    );
  }
}
