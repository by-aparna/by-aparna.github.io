import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkFooter extends StatefulWidget {
  const WorkFooter({super.key});

  @override
  State<WorkFooter> createState() => _WorkFooterState();
}

class _WorkFooterState extends State<WorkFooter> {
  int _isHovered = -1;

  Widget _makeSocialButton(
      int index, String filePath, Color bgColor, Function onClick) {
    return GestureDetector(
      onTap: () => onClick(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _isHovered == index
              ? Colors.blue.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered == index
              ? [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]
              : [],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Transform.scale(
            scale: _isHovered == index ? 1.1 : 1.0,
            child: SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(FilePath.imgAssetPath + filePath),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
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
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = 1),
              onExit: (_) => setState(() => _isHovered = -1),
              child: _makeSocialButton(
                  1, "linkedln.svg", const Color(0xFF2A639C), () {
                launchURL(
                  url:
                      "https://www.linkedin.com/in/aparna-chatterjee-b16043130/",
                );
              }),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = 2),
              onExit: (_) => setState(() => _isHovered = -1),
              child: _makeSocialButton(2, "medium.svg", Colors.white, () {
                launchURL(
                  url: "https://medium.com/@chatterjee.aparna1996",
                );
              }),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = 3),
              onExit: (_) => setState(() => _isHovered = -1),
              child: _makeSocialButton(3, "gmail.svg", Colors.white, () {
                launchURL(
                  url: "mailto:chatterjee.aparna1996@gmail.com",
                );
              }),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = 4),
              onExit: (_) => setState(() => _isHovered = -1),
              child: _makeSocialButton(4, "insta.svg", Colors.white, () {
                launchURL(
                  url: "https://www.instagram.com/aparnadesigner_studio/",
                );
              }),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
