import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:apptalma_empty/core/modules/general/flight-info/flight_info_main.dart';
import 'package:apptalma_empty/core/modules/general/panel/pages/panel_page.dart';

// main pages
class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // 🔹 Login
      GoRoute(
        path: '/',
        builder: (context, state) => const PanelPage(),
        // builder: (context, state) => Text("Texto inicial"),
      ),

      // // 🔹 Panel principal
      // GoRoute(
      //   path: '/panel',
      //   builder: (context, state) {
      //     final sessionData = state.extra as Session;
      //     return PanelMain(sessionData: sessionData);
      //   },
      // ),

      // // 🔹 Info de vuelos
      GoRoute(
        path: '/flight-info',
        builder: (context, state) => FlightInfoMain(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Página no encontrada')),
    ),
  );
}
