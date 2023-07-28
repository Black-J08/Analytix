import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationRouter extends StatelessWidget {
  const BottomNavigationRouter({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _switchScreen(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        itemPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        currentIndex: navigationShell.currentIndex,
        onTap: _switchScreen,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.dashboard_rounded),
            title: const Text("Portfolio"),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
