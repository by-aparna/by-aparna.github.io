import 'package:animated_emoji/animated_emoji.dart';
import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/utils/paint.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:aparna_chatterjee/view/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _animatedEmoji() {
    return MouseRegion(
      onHover: (event) => controller.forward(),
      onExit: (event) => controller.stop(canceled: true),
      child: AnimatedEmoji(
        AnimatedEmojis.wave,
        size: Responsive.isLargeMobile(context)
            ? 34
            : Responsive.isTablet(context)
                ? 48
                : 60,
        controller: controller,
        onLoaded: (duration) => controller.duration = duration,
      ),
    );
  }

  Widget _helloText() {
    return RichText(
      text: TextSpan(
        text: 'Hello, I\'m  ',
        style: MyTxtStyles.local_headingStyle(context).copyWith(
          color: MyColors.secondaryTxtColor,
          fontWeight: FontWeight.w700,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Aparna Chatterjee.',
            style: MyTxtStyles.local_headingStyle(context)
                .copyWith(
                    color: MyColors.secondaryTxtColor,
                    fontWeight: FontWeight.w700)
                .underlined(distance: 4, style: TextDecorationStyle.dashed),
          ),
        ],
      ),
    );
  }

  Widget _intros() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: _animatedEmoji(),
            ),
            const SizedBox(width: 8),
            _helloText(),
          ],
        ),
        const SizedBox(height: Dimens.defaultPadding),
        Text(
          Strings.intro_prof,
          style: MyTxtStyles.local_headingStyle(context)
              .copyWith(color: MyColors.highlightTxtColor),
        ),
        const SizedBox(height: Dimens.defaultPadding),
        Text(
          Strings.intro_loc,
          style: MyTxtStyles.local_primaryTextStyle(context)
              .copyWith(color: MyColors.secondaryTxtColor),
        ),
      ],
    );
  }

  Widget _tag({
    required String title,
    required Color titleColor,
    required Color borderColor,
    required Gradient gradient,
  }) {
    return Container(
      constraints:
          const BoxConstraints(minHeight: 32, minWidth: 150, maxWidth: 180),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.6),
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          '#$title',
          style: MyTxtStyles.local_buttonTextStyle(context)
              .copyWith(color: titleColor),
        ),
      ),
    );
  }

  Widget _experienceCard({
    required String title,
    required String description,
    required List<Widget> tagList,
    required Color descriptionBgColor,
    required Color assetBgColor,
    required Color cardBorderColor,
    required Image image,
    required SvgPicture logoImg,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: cardBorderColor),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      height: 500,
      width: MediaQuery.of(context).size.width * 0.76,
      child: ResponsiveRowColumn(
        layout: Responsive.isLargeMobile(context)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowOrder: 1,
            columnOrder: 2,
            child: Expanded(
              flex: 10,
              child: Container(
                color: descriptionBgColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: MyTxtStyles.local_headingStyle(context)
                              .copyWith(color: MyColors.highlightTxtColor),
                        ),
                        const SizedBox(height: Dimens.defaultPadding),
                        Text(
                          description,
                          style: MyTxtStyles.local_primaryTextStyle(context)
                              .copyWith(color: MyColors.secondaryTxtColor),
                        ),
                        const SizedBox(height: Dimens.defaultPadding),
                        Wrap(
                          clipBehavior: Clip.hardEdge,
                          spacing: 8,
                          runSpacing: 8,
                          children: tagList,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowOrder: 2,
            columnOrder: 1,
            child: Expanded(
              flex: 11,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Responsive.isLargeMobile(context)
                      ? Radius.circular(16)
                      : Radius.circular(0),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Responsive.isLargeMobile(context)
                      ? Radius.circular(0)
                      : Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: assetBgColor,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: image,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -48,
                      right: -38,
                      child: ClipPath(
                        clipper: EllipseClipper(),
                        child: Container(
                          color: Colors.white,
                          width: 137,
                          height: 110,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 6,
                      top: 8,
                      child: Container(
                        constraints: BoxConstraints.tight(const Size(80, 32)),
                        child: logoImg,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _workpage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.lbl_exp,
          style: MyTxtStyles.local_primaryTextStyle(context)
              .copyWith(color: MyColors.secondaryTxtColor),
        ),
        const SizedBox(height: 16),
        _experienceCard(
          title: 'Batch Swap',
          description:
              'Batch swapping enables users to exchange multiple tokens in a single transaction.',
          tagList: [
            _tag(
              title: 'Product Design',
              titleColor: const Color(0xFF99C2FF),
              borderColor: const Color(0xFF2966C2),
              gradient: LinearGradient(colors: [
                const Color(0xFF00407A).withOpacity(0.2),
                const Color(0xFF56AAF7).withOpacity(0.2)
              ]),
            ),
            _tag(
              title: 'Brand Design',
              titleColor: const Color(0xFFFFA279),
              borderColor: const Color(0xFFC25729),
              gradient: LinearGradient(colors: [
                const Color(0xFF7A3300).withOpacity(0.2),
                const Color(0xFFF79056).withOpacity(0.2)
              ]),
            ),
          ],
          cardBorderColor: const Color(0xFF424247),
          descriptionBgColor: const Color(0xFF020309).withOpacity(0.1),
          assetBgColor: const Color(0xFF65CDA8),
          image: Image.asset('${FilePath.imgAssetPath}batch_swap.png',
              fit: BoxFit.contain),
          logoImg: SvgPicture.asset('${FilePath.imgAssetPath}dzap.svg',
              width: 78, height: 22),
        ),
        const SizedBox(height: 56),
        _experienceCard(
          title: 'Investor Dashboard, Staking',
          description:
              'A tool for investors to track their token allocations, vesting schedule & claimable tokens in all the funding rounds.',
          tagList: [
            _tag(
              title: 'Product Re-Design',
              titleColor: const Color(0xFF99FFA9),
              borderColor: const Color(0xFF48C229),
              gradient: LinearGradient(colors: [
                const Color(0xFF207A00).withOpacity(0.2),
                const Color(0xFF56F7EE).withOpacity(0.2)
              ]),
            ),
          ],
          cardBorderColor: const Color(0xFF424247),
          descriptionBgColor: const Color(0xFF020309).withOpacity(0.1),
          assetBgColor: const Color(0xFF9382FF),
          image: Image.asset('${FilePath.imgAssetPath}staking.png'),
          logoImg: SvgPicture.asset('${FilePath.imgAssetPath}propel.svg'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double rightPadding =
        Dimens.defaultRightPaddingRatio * MediaQuery.of(context).size.width;
    double margin = Responsive.isLargeMobile(context)
        ? 20
        : Responsive.isTablet(context)
            ? 40
            : 100;
    return Column(
      children: [
        SizedBox(height: margin),
        Padding(
            padding: EdgeInsets.only(right: rightPadding), child: _intros()),
        SizedBox(height: margin * 2),
        _workpage(),
        SizedBox(height: margin),
      ],
    );
  }
}
