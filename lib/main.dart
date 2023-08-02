import 'package:analytix/screens/home/home.dart';
import 'package:analytix/screens/portfolio/portfolio.dart';
import 'package:analytix/screens/profile/profile.dart';
import 'package:analytix/screens/search/search.dart';
import 'package:analytix/shared/bottom_navigation_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellHomeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellPortfolioNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellPortfolio');
final _shellSearchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
final _shellProfileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => BottomNavigationRouter(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellHomeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellPortfolioNavigatorKey,
          routes: [
            GoRoute(
              path: '/portfolio',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PortfolioScreen(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellSearchNavigatorKey,
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchScreen(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellProfileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
            )
          ],
        ),
      ],
    )
  ],
);


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ColorScheme appThemeColors = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 138, 43, 226),
    brightness: Brightness.dark,
    background: const Color.fromARGB(255, 15, 15, 15),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: appThemeColors.surface,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: appThemeColors.onSurface,
          ),
        ),
        colorScheme: appThemeColors,
        useMaterial3: true,
      ),
      // home: const Home(),
    );
  }
}
