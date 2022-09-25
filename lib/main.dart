import 'package:flutter/material.dart';
import 'package:travenor/common/theme/theme.dart';
import 'package:travenor/views/splash_view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travenor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const SplashView(),
    );
  }
}
