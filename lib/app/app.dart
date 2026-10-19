import 'package:flutter/material.dart';

import '../routing/app_router.dart';
import '../theme/app_theme.dart';

class WhistleblowerApp extends StatelessWidget {
  const WhistleblowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whistleblower',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
