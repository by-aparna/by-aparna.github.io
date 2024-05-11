import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/home/pages/illustration.dart';
import 'package:aparna_chatterjee/view/home/pages/resume.dart';
import 'package:aparna_chatterjee/view/home/pages/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController controller;
  int pageIndex = 0;
  static const Duration animationDuration = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
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
          SvgPicture.asset(
              '${FilePath.imgAssetPath}aparna_chatterjee_logo.svg'),
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
        _animatePage(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.homeBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            _headers(width),
            const Divider(
              thickness: 0.4,
            ),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
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
                      color: MyColors.homeBackground,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isMobile(context)
                              ? (width * .06)
                              : (width * Dimens.defaultLeftPaddingRatio),
                        ),
                        child: _buildPage(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Work();
      case 1:
        return const About();
      case 2:
        return const Illustrations();
      default:
        return const SizedBox.shrink();
    }
  }
}
