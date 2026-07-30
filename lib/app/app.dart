import 'package:flutter/material.dart';

import '../design_system/tokens/stela_colors.dart';
import '../design_system/tokens/stela_typography.dart';
import 'router/app_router.dart';

class StelaApp extends StatelessWidget {
  const StelaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'STELA Indonesia',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: StelaColors.lightScheme,
      textTheme: StelaTypography.textTheme,
      scaffoldBackgroundColor: StelaColors.warmBackground,
    ),
    routerConfig: appRouter,
  );
}
