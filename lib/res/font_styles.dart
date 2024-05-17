import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../view/utils/responsive.dart';

class MyTxtStyles {
  static final TextStyle _headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 34, height: 1.6, fontWeight: FontWeight.w600);

  static final TextStyle _primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 21, height: 2.0, fontWeight: FontWeight.w400);

  static final TextStyle _bodyTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 20, fontWeight: FontWeight.w400);

  static final TextStyle buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 15, fontWeight: FontWeight.w400);

  static final TextStyle _desktop_headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 22, height: 2.0, fontWeight: FontWeight.w600);

  static final TextStyle _desktop_primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 18, height: 2.0, fontWeight: FontWeight.w400);

  static final TextStyle _desktop_bodyTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 20, fontWeight: FontWeight.w400);

  static final TextStyle _desktop_buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static final TextStyle _large_headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 20, height: 2.5, fontWeight: FontWeight.w600);

  static final TextStyle _large_primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 16, height: 2.3, fontWeight: FontWeight.w400);

  static final TextStyle _large_bodyTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 18, fontWeight: FontWeight.w400);

  static final TextStyle _large_buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 13, fontWeight: FontWeight.w400);

  static final TextStyle _mobile_headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 18, height: 2.3, fontWeight: FontWeight.w600);

  static final TextStyle _mobile_primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 12, height: 2.2, fontWeight: FontWeight.w400);

  static final TextStyle _mobile_bodyTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 14, height: 22, fontWeight: FontWeight.w400);

  static final TextStyle _mobile_buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle local_headingStyle(context) => Responsive.isMobile(context)
      ? MyTxtStyles._mobile_headingTextStyle
      : Responsive.isLargeMobile(context)
          ? MyTxtStyles._large_headingTextStyle
          : Responsive.isTablet(context)
              ? MyTxtStyles._desktop_headingTextStyle
              : MyTxtStyles._headingTextStyle;

  static TextStyle local_primaryTextStyle(context) =>
      Responsive.isMobile(context)
          ? MyTxtStyles._mobile_primaryTextStyle
          : Responsive.isLargeMobile(context)
              ? MyTxtStyles._large_primaryTextStyle
              : Responsive.isTablet(context)
                  ? MyTxtStyles._desktop_primaryTextStyle
                  : MyTxtStyles._primaryTextStyle;

  static double local_primaryFontSize(context) => Responsive.isMobile(context)
      ? 16
      : Responsive.isLargeMobile(context)
          ? 20
          : Responsive.isTablet(context)
              ? 22
              : 28;

  static TextStyle local_bodyTextStyle(context) => Responsive.isMobile(context)
      ? MyTxtStyles._mobile_bodyTextStyle
      : Responsive.isLargeMobile(context)
          ? MyTxtStyles._large_bodyTextStyle
          : Responsive.isTablet(context)
              ? MyTxtStyles._desktop_bodyTextStyle
              : MyTxtStyles._bodyTextStyle;

  static TextStyle local_buttonTextStyle(context) =>
      Responsive.isMobile(context)
          ? MyTxtStyles._mobile_buttonTextStyle
          : Responsive.isLargeMobile(context)
              ? MyTxtStyles._large_buttonTextStyle
              : Responsive.isTablet(context)
                  ? MyTxtStyles._desktop_buttonTextStyle
                  : MyTxtStyles.buttonTextStyle;
}
