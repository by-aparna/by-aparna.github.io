import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../res/color.dart';
import '../../../res/dimens.dart';
import '../../../res/font_styles.dart';
import '../../utils/paint.dart';
import '../../utils/responsive.dart';

class ExperienceCard extends StatefulWidget {
  final String title;
  final String description;
  final List<Widget> tagList;
  final Color descriptionBgColor;
  final Color assetBgColor;
  final Color cardBorderColor;
  final Image image;
  final SvgPicture logoImg;
  final bool isHovered;

  const ExperienceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.tagList,
      required this.descriptionBgColor,
      required this.assetBgColor,
      required this.cardBorderColor,
      required this.image,
      required this.logoImg,
      required this.isHovered});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: widget.cardBorderColor),
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
              child: MouseRegion(
                onEnter: (_) => _controller.forward(),
                onExit: (_) => _controller.reverse(),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCirc,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: widget.isHovered
                              ? widget.assetBgColor
                              : widget.descriptionBgColor,
                          width: widget.isHovered ? 0.5 : 1,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      gradient: widget.isHovered
                          ? RadialGradient(
                              center: Alignment.centerLeft,
                              radius: 1.2,
                              colors: [
                                widget.assetBgColor.withOpacity(0.15),
                                widget.descriptionBgColor.withOpacity(0),
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                widget.assetBgColor.withOpacity(0.15),
                                widget.descriptionBgColor.withOpacity(0),
                              ],
                            ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: MyTxtStyles.local_headingStyle(context)
                                  .copyWith(color: MyColors.highlightTxtColor),
                            ),
                            const SizedBox(height: Dimens.defaultPadding),
                            Text(
                              widget.description,
                              style: MyTxtStyles.local_primaryTextStyle(context)
                                  .copyWith(color: MyColors.secondaryTxtColor),
                            ),
                            const SizedBox(height: Dimens.defaultPadding),
                            Wrap(
                              clipBehavior: Clip.hardEdge,
                              spacing: 8,
                              runSpacing: 8,
                              children: widget.tagList,
                            ),
                          ],
                        ),
                      ),
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
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Matrix4.identity()
                          ..scale(widget.isHovered ? 1.2 : 1.0),
                        color: widget.assetBgColor,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: widget.image,
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
                        child: widget.logoImg,
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
}
