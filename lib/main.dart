import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travenor/common/theme/theme.dart';
import 'package:travenor/common/utils/route_util.dart';
import 'package:travenor/views/splash_view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travenor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const SplashView(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
