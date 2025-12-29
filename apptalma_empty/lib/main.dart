import 'package:flutter/material.dart';
import 'core/routes/routes.dart';
import 'package:apptalma_empty/core/theme/talma_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Talma App',
      theme: TalmaTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
