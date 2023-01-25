import 'package:flutter/material.dart';

class ScreenSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getHeightWithoutSafeArea(BuildContext context) {
    var padding = MediaQuery.of(context).viewPadding;
    return getHeight(context) - padding.top - padding.bottom;
  }
}
