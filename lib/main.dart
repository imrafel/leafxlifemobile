import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const LeafXLifeApp());
}

class LeafXLifeApp extends StatelessWidget {
  const LeafXLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaf X Life',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}