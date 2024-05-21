import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:flutter/cupertino.dart';

class Dimens {
  static const double defaultPadding = 20;
  static const double menuPadding = 16;
  static const double defaultLeftPaddingRatio = .12;
  static const double defaultRightPaddingRatio = .10;

  static double responsiveMargin(BuildContext context) =>
      Responsive.isMobile(context)
          ? 16
          : Responsive.isLargeMobile(context)
              ? 24
              : Responsive.isTablet(context)
                  ? 32
                  : Responsive.isDesktop(context)
                      ? 48
                      : 60;

  static EdgeInsetsGeometry responsivePadding(BuildContext context) =>
      Responsive.isMobile(context)
          ? const EdgeInsets.symmetric(horizontal: 14, vertical: 8)
          : Responsive.isLargeMobile(context)
              ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
              : Responsive.isTablet(context)
                  ? const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 14);
}
