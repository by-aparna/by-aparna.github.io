import 'package:aparna_chatterjee/res/color.dart';
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
          _isHovered ? MyColors.highlightColor : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          'Résumé'.toUpperCase(),
          style: MyTxtStyles.local_buttonTextStyle(context).copyWith(
              color: _isHovered
                  ? MyColors.secondaryBackground
                  : MyColors.highlightColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              letterSpacing: 4),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://drive.google.com/file/d/1xD-szCqvM1m29B3SK7V3hn9MxBTXQM2x/view';
    if (await canLaunchUrlString(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
