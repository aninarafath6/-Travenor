import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:travenor/common/constants/color_constants.dart';
import 'package:travenor/views/onboarding_view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = "/splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(milliseconds: 2200));
          Get.offAndToNamed(OnboardingView.routeName);
        }
      });
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            var value = const ElasticInOutCurve(1)
                .transform(_animationController.value);
            return Opacity(
              opacity: _animationController.value,
              child: Transform.scale(
                scale: value,
                child: Transform.translate(
                  offset: Offset(0, lerpDouble(100, 0, value)!),
                  child: child,
                ),
              ),
            );
          },
          child: const Text(
            "Travenor",
            style: TextStyle(
              fontFamily: "Geometr415 Blk BT",
              color: AppColors.white,
              fontSize: 34,
            ),
          ),
        ),
      ),
    );
  }
}
