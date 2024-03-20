import 'package:bari_koi_map_with_autocomplete/core/widgets/shell_widget.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/screen/map_screen.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// it will return [GoRouter] object,
/// that can be use for navigation between pages
GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  /*errorBuilder: (context, state) {
    return const PageNotFound();
  },*/
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/saved',
          name: 'Saved',
          builder: (context, state) => Scaffold(),
        ),
      ],
      builder: (context, state, child) => ShellWidget(
        child: child,
      ),
    ),
  ],
);
