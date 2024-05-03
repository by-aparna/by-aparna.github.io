import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../view/utils/responsive.dart';

class MyTxtStyles {
  static final TextStyle _headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 34, height: 1.2, fontWeight: FontWeight.w600);

  static final TextStyle _primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 21, height: 1.3, fontWeight: FontWeight.w400);

  static final TextStyle _bodyTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 20, fontWeight: FontWeight.w400);

  static final TextStyle buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 15, fontWeight: FontWeight.w400);


  static final TextStyle _mobile_headingTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 16, height: 1.2, fontWeight: FontWeight.w600);

  static final TextStyle _mobile_primaryTextStyle = GoogleFonts.poppins()
      .copyWith(fontSize: 12, height: 1.3, fontWeight: FontWeight.w400);

  static final TextStyle _mobile_bodyTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static final TextStyle _mobile_buttonTextStyle =
      GoogleFonts.poppins().copyWith(fontSize: 13, fontWeight: FontWeight.w400);

  static TextStyle local_headingStyle(context) => Responsive.isMobile(context) ?  MyTxtStyles._mobile_headingTextStyle : MyTxtStyles._headingTextStyle;
  static TextStyle local_primaryTextStyle(context) => Responsive.isMobile(context) ?  MyTxtStyles._mobile_primaryTextStyle : MyTxtStyles._primaryTextStyle;
  static TextStyle local_bodyTextStyle(context) => Responsive.isMobile(context) ?  MyTxtStyles._mobile_bodyTextStyle : MyTxtStyles._bodyTextStyle;
  static TextStyle local_buttonTextStyle(context) => Responsive.isMobile(context) ?  MyTxtStyles._mobile_buttonTextStyle : MyTxtStyles.buttonTextStyle;
}
