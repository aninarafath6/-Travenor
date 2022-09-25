import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/common/constants/color_constants.dart';
import 'package:travenor/common/utils/dimension.dart';
import 'package:travenor/controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const routeName = "/onboarding";

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
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
      body: Column(
        children: [
          SizedBox(
            width: context.getWidth(100),
            height: context.getHeight(52),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                    lerpDouble(30, 30, _animationController.value)!),
              ),
              child: Obx(
                () {
                  return FadeTransition(
                    alwaysIncludeSemantics: true,
                    opacity: _animationController,
                    child: Image.asset(
                      _onboardingController
                          .onboardingList[_onboardingController.selectedIndex]
                          .imageURL!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _title(index),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        _onboardingController.onboardingList[index].subText!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Gill Sans MT",
                          color: LightApp.subText,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (index) {
                _onboardingController.onChange(index);
                if (_animationController.isCompleted) {
                  _animationController.reset();
                  _animationController.forward();
                } else {
                  _animationController.forward();
                }
              },
              itemCount: _onboardingController.onboardingList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const [
                CustomButton(label: "Get Started"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RichText _title(int index) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: _onboardingController.onboardingList[index].title,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: "Geometr415 Blk BT",
          color: LightApp.textColor,
        ),
        children: [
          TextSpan(
            text: _onboardingController.onboardingList[index].spclText,
            style: const TextStyle(
              color: AppColors.actionColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.label,
    this.onTap,
  }) : super(key: key);
  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.primaryColor,
          ),
        ),
        onPressed: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: Center(
            child: Text(
              label ?? "",
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
