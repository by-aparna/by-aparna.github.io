import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../res/font_styles.dart';

class HoverCardButton extends StatefulWidget {
  const HoverCardButton({super.key});

  @override
  State<HoverCardButton> createState() => _HoverCardButtonState();
}

class _HoverCardButtonState extends State<HoverCardButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchURL();
      },
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: MyColors.highlightColor,
              width: 0.7,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          _isHovered ? MyColors.highlightColor : MyColors.secondaryBackground,
        ),
      ),
      child: Padding(
        padding: Dimens.responsivePadding(context),
        child: Text(
          'Résumé'.toUpperCase(),
          style: MyTxtStyles.local_buttonTextStyle(context).copyWith(
              color: _isHovered
                  ? MyColors.secondaryBackground
                  : MyColors.highlightColor,
              fontWeight: FontWeight.w600,
              fontSize: MyTxtStyles.local_ctaFontSize(context),
              letterSpacing: 4),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://drive.google.com/file/d/1wZTRhP99HMzjk5F0U3TFipWm3LUvNU-B/view?usp=sharing';
    if (await canLaunchUrlString(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
