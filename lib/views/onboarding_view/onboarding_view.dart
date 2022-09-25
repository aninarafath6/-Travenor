import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/common/constants/color_constants.dart';
import 'package:travenor/common/utils/dimension.dart';
import 'package:travenor/common/widgets/custom_button.dart';
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
      body: Obx(() {
        return Column(
          children: [
            SizedBox(
              width: context.getWidth(100),
              height: context.getHeight(52),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      lerpDouble(30, 30, _animationController.value)!),
                ),
                child: FadeTransition(
                  alwaysIncludeSemantics: true,
                  opacity: _animationController,
                  child: Image.asset(
                    _onboardingController
                        .onboardingList[_onboardingController.selectedIndex]
                        .imageURL!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            _title(_onboardingController.selectedIndex),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _animationController.value,
                      child: Text(
                        _onboardingController
                            .onboardingList[_onboardingController.selectedIndex]
                            .subText!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Gill Sans MT",
                          color: LightApp.subText,
                          height: 1.5,
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  () {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _onboardingController.onboardingList.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width:
                                  _onboardingController.selectedIndex == index
                                      ? 35
                                      : index == 0
                                          ? 16
                                          : 8,
                              height: 10,
                              decoration: BoxDecoration(
                                color:
                                    _onboardingController.selectedIndex == index
                                        ? AppColors.primaryColor
                                        : AppColors.lightCyan,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.only(right: 7),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          label: _onboardingController.selectedIndex == 0
                              ? "Get Started"
                              : "Next",
                          onTap: () {
                            _onboardingController.next();
                            if (_animationController.isCompleted) {
                              _animationController.reset();
                              _animationController.forward();
                            } else {
                              _animationController.forward();
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  AnimatedSwitcher _title(int index) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: RichText(
        key: ValueKey(_onboardingController.onboardingList[index].title),
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
      ),
    );
  }
}
