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
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
