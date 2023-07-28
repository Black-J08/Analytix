import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix"),
      ),
      body: Text(
        "Portfolio",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 40,
        ),
      ),
    );
  }
}
