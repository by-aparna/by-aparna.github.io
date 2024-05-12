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
  final ScrollController _scrollcontroller = ScrollController();

  double _containerTopOffset = double.infinity;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
    animationController = AnimationController(
      vsync: this,
    );
    _scrollcontroller.addListener(_scrollListener);
  }

  Widget _menu({
    required String title,
    required bool isSelected,
    required VoidCallback onClick,
  }) {
    return InkWell(
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
          InkWell(
            onTap: () {
              _handleMenuClick(-1);
              if (_introKey.currentContext == null) return;

              Scrollable.ensureVisible(_introKey.currentContext!,
                  alignment: 0.0, // Adjust alignment as needed
                  duration: const Duration(milliseconds: 0),
                  curve: Curves.fastLinearToSlowEaseIn);
            },
            child: SvgPicture.asset(
                '${FilePath.imgAssetPath}aparna_chatterjee_logo.svg'),
          ),
          const Spacer(),
          _menu(
            title: Strings.menu_work,
            isSelected: pageIndex == 0,
            onClick: () {
              _handleMenuClick(0);
              _scrollToElement(context);
            },
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
    if (index == -1) {
      setState(() {
        if (pageIndex != 0) {
          pageIndex = 0;
        }
        controller.jumpTo(0);
      });
      return;
    }
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
        decoration: pageIndex == 0 &&
                _containerTopOffset >= Dimens.responsiveMargin(context)
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
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      controller: _scrollcontroller,
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
    _scrollcontroller.removeListener(_scrollListener);
    _scrollcontroller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final RenderBox? containerRenderBox =
        _workkey.currentContext?.findRenderObject() as RenderBox?;
    if (containerRenderBox != null) {
      final containerPosition =
          containerRenderBox.localToGlobal(Offset.zero).dy;
      setState(() {
        _containerTopOffset = containerPosition - 50;
      });
    }
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
        InkWell(
          onHover: (isHovered) => setState(() => _txtHovered = isHovered),
          onTap: () => _handleMenuClick(1),
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

  final GlobalKey _introKey = GlobalKey();
  final GlobalKey _workkey = GlobalKey();

  void _scrollToElement(BuildContext context) {
    if (_workkey.currentContext == null) return;

    // Scroll to the calculated offset
    Scrollable.ensureVisible(
      _workkey.currentContext!,
      alignment: 0.1, // Adjust alignment as needed
      duration: const Duration(milliseconds: 200),
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
              key: _introKey,
              padding: EdgeInsets.only(
                  left: _rpag, right: _pad, top: margin, bottom: margin),
              child: _intros()),
          Container(
              key: _workkey,
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
