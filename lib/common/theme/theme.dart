import 'package:flutter/material.dart';
import 'package:travenor/common/theme/text_theme/custom_paragraph.dart';
import 'package:travenor/common/theme/text_theme/custom_heading.dart';

class AppTheme {
  AppTheme();
  static ThemeData theme() {
    return ThemeData(
      fontFamily: "sf-ui",
      textTheme: TextTheme(
        headline1: CustomHeading.heading1(),
        headline2: CustomHeading.heading2(),
        headline3: CustomHeading.heading3(),
        displayLarge: CustomParagraph.paragraph1(),
        displayMedium: CustomParagraph.paragraph2(),
        displaySmall: CustomParagraph.paragraph3(),
      ),
    );
  }
}
