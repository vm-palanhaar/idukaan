import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/view/init_screen.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/idukaan',
  routes: <RouteBase>[
    GoRoute(
      path: '/idukaan',
      builder: (BuildContext context, GoRouterState state) {
        return const InitScreen();
      },
      routes: const <RouteBase>[],
    ),
  ],
);
