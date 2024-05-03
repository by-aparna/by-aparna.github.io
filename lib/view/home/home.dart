import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/home/pages/illustration.dart';
import 'package:aparna_chatterjee/view/home/pages/resume.dart';
import 'package:aparna_chatterjee/view/home/pages/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController controller;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
  }

  Widget _menu(
      {required String title,
      required bool isSelected,
      required Function onClick}) {
    return GestureDetector(
      onTap: () => onClick(),
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
                height: 0,
              ),
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

  _animatePage() {
    controller.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  Widget _headers() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
              '${FilePath.imgAssetPath}aparna_chatterjee_logo.svg'),
          const Spacer(),
          _menu(
              title: Strings.menu_work,
              isSelected: pageIndex == 0,
              onClick: () {
                print('work click');
                setState(() {
                  if (pageIndex != 0) {
                    pageIndex = 0;
                    _animatePage();
                  }
                });
              }),
          _menu(
              title: Strings.menu_resume,
              isSelected: pageIndex == 1,
              onClick: () {
                setState(() {
                  if (pageIndex != 1) {
                    pageIndex = 1;
                    _animatePage();
                  }
                });
              }),
          _menu(
              title: Strings.menu_illus,
              isSelected: pageIndex == 2,
              onClick: () {
                setState(() {
                  if (pageIndex != 2) {
                    pageIndex = 2;
                    _animatePage();
                  }
                });
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.secondaryBackground,
      body: Padding(
        padding: EdgeInsets.only(
            left: width * Dimens.defaultLeftPaddingRatio,
            right: width * Dimens.defaultRightPaddingRatio,
            top: 32),
        child: Column(
          children: [
            _headers(),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (page) {
                  setState(() {
                    pageIndex = page;
                  });
                },
                children: [const Work(), Resume(), const Illustrations()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
