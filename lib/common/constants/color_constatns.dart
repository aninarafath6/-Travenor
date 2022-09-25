import 'package:flutter/painting.dart';

abstract class AppColors {
  static const primaryColor = Color(0xff0D6EFD);
  static const subTextColor = Color(0xff707B81);
}

class LightApp extends AppColors {
  static const textColor = Color(0xff1B1E28);
  static const boxFill = Color(0xffF7F7F9);
  static const actionColor = Color(0xffFF7029);
  static const lineStokeColor = Color(0xffF8F9FA);
  static const bgColor = Color(0xffFFFFFF);
  static const frameColor = Color(0xffF8F9FA);
}

class DarkApp extends AppColors {
  static const textColor = Color(0xffFFFFFF);
  static const frameColor = Color(0xff16181F);
  static const shapeColor = Color(0xff20232D);
}
