import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/color.dart';
import '../../res/dimens.dart';
import '../../res/font_styles.dart';
import '../../res/strings.dart';
import '../utils/responsive.dart';

class LearnPage extends StatefulWidget {
  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  int _pageIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildLeading() {
    return PreferredSize(
      preferredSize: const Size(100, 150), // Set the size of the leading item
      child: Container(
        // Add padding to create a flexible margin
        padding: EdgeInsets.only(
            left: Responsive.isLargeMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 60
                    : 150),
        child: SvgPicture.asset(
            '${FilePath.imgAssetPath}aparna_chatterjee_logo.svg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 150,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.centerLeft,
                    colors: [
                      Colors.transparent,
                      MyColors.homeBackground,
                    ],
                  ),
                ),
              ),
            ),
            expandedHeight: 100,
            floating: true,
            pinned: true,
            leading: _buildLeading(),
            actions: [
              _menu(
                title: Strings.menu_work,
                isSelected: _pageIndex == 0,
                onClick: () => _selectPage(0),
              ),
              _menu(
                title: Strings.menu_resume,
                isSelected: _pageIndex == 1,
                onClick: () => _selectPage(1),
              ),
              _menu(
                title: Strings.menu_illus,
                isSelected: _pageIndex == 2,
                onClick: () => _selectPage(2),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyColors.homeBackground.withOpacity(0.5),
                    MyColors.homeBackground.withOpacity(0.0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // _headers(),
                  SizedBox(
                    height: 20,
                  ),
                  // _intros(width),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(
      {required String title,
      required bool isSelected,
      required VoidCallback onClick}) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.menuPadding, vertical: Dimens.defaultPadding),
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

  void _selectPage(int index) {
    if (_pageIndex != index) {
      setState(() {
        _pageIndex = index;
      });
    }
  }
}
