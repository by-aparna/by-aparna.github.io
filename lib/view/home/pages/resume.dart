import 'dart:math';

import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../components/hoverbutton.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeMobile = Responsive.isLargeMobile(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 82,
            ),
            Text(
              'Meet Aparna',
              style: MyTxtStyles.local_headingStyle(context).copyWith(
                color: MyColors.highlightTxtColor,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
                child: isLargeMobile
                    ? _mobileAboutMeLayout(context)
                    : _desktopAboutMeLayout(context))
          ],
        );
      },
    );
  }

  Widget _mobileAboutMeLayout(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: SizedBox(height: 300, child: _buildImage(context))),
        const SizedBox(
          height: 16,
        ),
        _buildDescription(context),
      ],
    );
  }

  Widget _desktopAboutMeLayout(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildDescription(context)),
        const SizedBox(
          width: 26,
        ),
        Expanded(flex: 1, child: _buildImage(context))
      ],
    );
  }

  Widget _buildDescription(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text.rich(
          TextSpan(
            text: 'I\'m a designer with deep ', // default style
            style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
              color: MyColors.secondaryTxtColor,
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: MyTxtStyles.local_primaryFontSize(context),
                ),
              ),
              TextSpan(
                text:
                    ' for the art of design. My journey began in architecture, where I learned to design physical spaces that blend beauty with functionality.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ), // colored
              ),
              TextSpan(
                text:
                    '\n\nOver time, my curiosity led me to explore the digital landscape. Fascinated by its possibilities, I ventured into crafting engaging experiences in the digital space.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ), //
              ),
              TextSpan(
                text:
                    '\n\nI\'m a self-taught designer, having delved into UX/UI and product design through workshops, blogs, and hands-on projects.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ), //
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        const HoverCardButton(),
      ],
    );
  }

  Widget _buildImage(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        height: min(MediaQuery.of(context).size.width * .6, 900),
        child: Image.asset(
          '${FilePath.imgAssetPath}me.jpeg',
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
