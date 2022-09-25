import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextStyle heading1() {
    return const TextStyle(
      fontFamily: "sf-ui",
      fontSize: 38,
    );
  }

  static TextStyle heading2() {
    return const TextStyle(
      fontFamily: "sf-ui",
      fontWeight: FontWeight.w400,
      fontSize: 24,
    );
  }

  static TextStyle heading3() {
    return const TextStyle(
      fontFamily: "sf-ui",
      fontSize: 16,
    );
  }
}
