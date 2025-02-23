import 'package:flutter/material.dart';

import 'core/Router/app_router.dart';

void main() {
  runApp(BreakingBad(
    appRouter: AppRouter(),
  ));
}

class BreakingBad extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBad({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter().generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
