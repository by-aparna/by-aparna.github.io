import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 550;
  }

  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 700;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 900;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 900;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1400;
  }
}
