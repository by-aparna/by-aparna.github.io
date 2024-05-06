import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/responsive.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
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
      ),
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
        _buildText(
          context,
          'I\'m a designer with deep <3 for the art of design. My journey began in architecture, where I learned to design physical spaces that blend beauty with functionality.',
        ),
        _buildSizedBox(context),
        _buildText(
          context,
          'Over time, my curiosity led me to explore the digital landscape. Fascinated by its possibilities, I ventured into crafting engaging experiences in the digital space.',
        ),
        _buildSizedBox(context),
        _buildText(
          context,
          'I\'m a self-taught designer, having delved into UX/UI and product design through workshops, blogs, and hands-on projects.',
        ),
      ],
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Text(
      text,
      style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
        color: MyColors.secondaryTxtColor,
      ),
    );
  }

  Widget _buildSizedBox(BuildContext context) {
    return const SizedBox(
      height: Dimens.defaultPadding, // Can adjust based on screen size
    );
  }

  Widget _buildImage(context) {
    return Image.asset('${FilePath.imgAssetPath}me.jpeg');
  }
}
