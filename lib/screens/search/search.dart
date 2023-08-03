import 'package:flutter/material.dart';
import 'package:analytix/screens/search/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytix"),
      ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: SearchBarSuggestion(),
        )
    );
  }
}
