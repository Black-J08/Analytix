import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix"),
      ),
      body: Text(
        "Search",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 40,
        ),
      ),
    );
  }
}
