import 'package:animated_emoji/animated_emoji.dart';
import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/home/pages/illustration.dart';
import 'package:aparna_chatterjee/view/home/pages/resume.dart';
import 'package:aparna_chatterjee/view/home/pages/work.dart';
import 'package:aparna_chatterjee/view/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final PageController controller;
  bool _txtHovered = false;

  late final AnimationController animationController;
  int pageIndex = 0;
  static const Duration animationDuration = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
    animationController = AnimationController(
      vsync: this,
    );
  }

  Widget _menu({
    required String title,
    required bool isSelected,
    required VoidCallback onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.menuPadding),
        child: Column(
          children: [
            Text(
              title,
              style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                color: isSelected
                    ? MyColors.highlightTxtColor
                    : MyColors.secondaryTxtColor,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? MyColors.highlightTxtColor
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _animatePage(int page) {
    controller.animateToPage(
      page,
      duration: animationDuration,
      curve: Curves.ease,
    );
  }

  Widget _headers(double width) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 16,
        left: width * Dimens.defaultLeftPaddingRatio,
        right: width * Dimens.defaultRightPaddingRatio,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => _handleMenuClick(0),
            child: SvgPicture.asset(
                '${FilePath.imgAssetPath}aparna_chatterjee_logo.svg'),
          ),
          const Spacer(),
          _menu(
            title: Strings.menu_work,
            isSelected: pageIndex == 0,
            onClick: () => _handleMenuClick(0),
          ),
          _menu(
            title: Strings.menu_resume,
            isSelected: pageIndex == 1,
            onClick: () => _handleMenuClick(1),
          ),
          _menu(
            title: Strings.menu_illus,
            isSelected: pageIndex == 2,
            onClick: () => _handleMenuClick(2),
          ),
        ],
      ),
    );
  }

  void _handleMenuClick(int index) {
    if (pageIndex != index) {
      setState(() {
        pageIndex = index;
        if (pageIndex != -1) {
          _animatePage(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.homeBackground,
      body: Container(
        decoration: pageIndex == 0
            ? const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${FilePath.imgAssetPath}bg.png'),
                    fit: BoxFit.none,
                    alignment: Alignment.topCenter),
              )
            : const BoxDecoration(color: MyColors.secondaryBackground),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: [
              _headers(width),
              const Divider(
                height: 4,
                thickness: 0.3,
              ),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Container(
                        child: _buildPage(index, width),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  Widget _animatedEmoji() {
    return AnimatedEmoji(
      AnimatedEmojis.wave,
      size: Responsive.isLargeMobile(context)
          ? 34
          : Responsive.isTablet(context)
              ? 48
              : 60,
      controller: animationController,
      onLoaded: (duration) => animationController.duration = duration,
    );
  }

  Widget _helloText() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        Text(
          'Hello, I\'m  ',
          style: MyTxtStyles.local_headingStyle(context).copyWith(
            color: MyColors.secondaryTxtColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        MouseRegion(
          onHover: (_) => setState(() => _txtHovered = true),
          onExit: (_) => setState(() => _txtHovered = false),
          child: Text(
            ' Aparna Chatterjee.  ',
            style: MyTxtStyles.local_headingStyle(context)
                .copyWith(
                    color: MyColors.secondaryTxtColor,
                    fontWeight: FontWeight.bold)
                .underlined(
                    distance: 4,
                    color: _txtHovered
                        ? MyColors.highlightColor
                        : MyColors.secondaryTxtColor),
          ),
        ),
      ],
    );
  }

  Widget _intros() {
    return MouseRegion(
      onHover: (event) {
        animationController.forward();
        animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            animationController.reverse();
          }
        });
      },
      onExit: (event) => animationController.stop(canceled: true),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _animatedEmoji(),
              ),
              const SizedBox(width: 8),
              _helloText(),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            Strings.intro_prof,
            style: MyTxtStyles.local_headingStyle(context)
                .copyWith(color: MyColors.highlightTxtColor),
          ),
          const SizedBox(height: 40),
          Text(
            Strings.intro_loc,
            style: MyTxtStyles.local_primaryTextStyle(context)
                .copyWith(color: MyColors.secondaryTxtColor),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index, double width) {
    double rightPadding =
        Dimens.defaultRightPaddingRatio * MediaQuery.of(context).size.width;
    double margin = Responsive.isLargeMobile(context)
        ? 20
        : Responsive.isTablet(context)
            ? 30
            : 60;
    switch (index) {
      case 0:
        double _rpag = (Responsive.isMobile(context)
            ? (width * .06)
            : (width * Dimens.defaultLeftPaddingRatio));
        double _pad = rightPadding + _rpag;
        return Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  left: _rpag, right: _pad, top: margin, bottom: margin),
              child: _intros()),
          Container(
              padding: EdgeInsets.only(
                left: _rpag,
                top: margin,
              ),
              color: MyColors.secondaryBackground,
              width: MediaQuery.of(context).size.width,
              child: const Work()),
        ]);
      case 1:
        return Container(
            color: MyColors.secondaryBackground,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context)
                  ? (width * .06)
                  : (width * Dimens.defaultLeftPaddingRatio),
            ),
            child: const About());
      case 2:
        return Container(
            color: MyColors.secondaryBackground,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context)
                  ? (width * .06)
                  : (width * Dimens.defaultLeftPaddingRatio),
            ),
            child: const Illustrations());
      default:
        return const SizedBox.shrink();
    }
  }
}
