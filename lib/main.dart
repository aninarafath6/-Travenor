import 'package:flutter/material.dart';
import 'package:travenor/common/theme/theme.dart';

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
    );
  }
}
