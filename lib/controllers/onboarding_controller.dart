import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travenor/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  final _selectedIndex = 0.obs;
  final PageController _pageController = PageController();

  final _onboardingList = [
    OnboardingModel(
      title: "Life is short and the\nworld is ",
      spclText: "wide",
      subText:
          "At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world",
      imageURL: "assets/images/png/onboarding/onboarding-1.png",
    ),
    OnboardingModel(
      title: "It’s a big world out\nthere go ",
      spclText: "explore",
      subText:
          "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
      imageURL: "assets/images/png/onboarding/onboarding-2.png",
    ),
    OnboardingModel(
      title: "People don’t take trips,\ntrips take  ",
      spclText: "people",
      subText:
          "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
      imageURL: "assets/images/png/onboarding/onboarding-3.png",
    ),
  ];

  List<OnboardingModel> get onboardingList => _onboardingList;
  int get selectedIndex => _selectedIndex.value;
  PageController get pageController => _pageController;

  void onChange(int index) {
    _selectedIndex.value = index;
  }
}
