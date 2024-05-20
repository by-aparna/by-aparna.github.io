import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkFooter extends StatelessWidget {
  const WorkFooter({super.key});

  Widget _makeSocialButton(String filePath, Color bgColor, Function onClick) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(8),
      child: InkWell(
          onTap: () {
            onClick();
          },
          child: SvgPicture.asset(FilePath.imgAssetPath + filePath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Strings.lbl_connect,
          style: MyTxtStyles.local_headingStyle(context)
              .copyWith(color: const Color(0xFFC0D5F5)),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          Strings.desc_connect,
          style: MyTxtStyles.local_primaryTextStyle(context)
              .copyWith(color: const Color(0xFFC0D5F5)),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _makeSocialButton("linkedln.svg", const Color(0xFF2A639C), () {
              launchURL(
                url: "https://www.linkedin.com/in/aparna-chatterjee-b16043130/",
              );
            }),
            _makeSocialButton("medium.svg", Colors.white, () {
              launchURL(
                url: "https://medium.com/@chatterjee.aparna1996",
              );
            }),
            _makeSocialButton("gmail.svg", Colors.white, () {
              launchURL(
                url: "mailto:chatterjee.aparna1996@gmail.com",
              );
            }),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
