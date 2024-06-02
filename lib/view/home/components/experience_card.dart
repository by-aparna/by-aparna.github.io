import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final Widget image;
  final SvgPicture logoImg;
  final bool isHovered;
  final String url;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.tagList,
    required this.descriptionBgColor,
    required this.assetBgColor,
    required this.image,
    required this.logoImg,
    required this.isHovered,
    required this.url,
  });

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
    if (_shouldAnimate()) {
      _controller.forward();
    }
  }

  bool _shouldAnimate() {
    return widget.isHovered && _isHorizontal();
  }

  bool _isHorizontal() {
    return !Responsive.isTablet(context);
  }

  @override
  void didUpdateWidget(covariant ExperienceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isHorizontal()) return;
    if (widget.isHovered != oldWidget.isHovered) {
      if (widget.isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!Responsive.isDesktop(context) && widget.url.isEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(widget.title),
              content: Text(
                  '${widget.title} is in progress. Will be updated shortly!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Continue :-)'),
                ),
              ],
            ),
          );
          return;
        }
        if (widget.url.isNotEmpty) {
          await launch(widget.url, forceSafariVC: false);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.assetBgColor.withOpacity(0.8),
            width: 0.8,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
        ),
        height: Responsive.isLargeMobile(context) ? 600 : 500,
        width: MediaQuery.of(context).size.width * 0.76,
        child: ResponsiveRowColumn(
          layout: Responsive.isTablet(context)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowOrder: 1,
              columnOrder: 2,
              child: Expanded(
                flex: 1,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCirc,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: _shouldAnimate()
                              ? widget.assetBgColor
                              : widget.descriptionBgColor,
                          width: widget.isHovered ? 0.8 : 1,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      gradient: _shouldAnimate()
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
                            if (widget.url.isEmpty &&
                                MediaQuery.of(context).size.width >= 1200)
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2 * Dimens.defaultPadding),
                                  child: Text(
                                    'Coming Soon...',
                                    style:
                                        MyTxtStyles.local_headingStyle(context)
                                            .copyWith(
                                      fontSize: MyTxtStyles.local_ctaFontSize(
                                          context),
                                      color: MyColors.highlightTxtColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Responsive.isLargeMobile(context)
                        ? const Radius.circular(16)
                        : const Radius.circular(0),
                    topRight: const Radius.circular(16),
                    bottomLeft: const Radius.circular(0),
                    bottomRight: Responsive.isLargeMobile(context)
                        ? const Radius.circular(0)
                        : const Radius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.only(
                            right: Dimens.responsiveMargin(context),
                            top: Dimens.responsiveMargin(context) + 30,
                          ),
                          transform: Matrix4.identity()
                            ..scale(_shouldAnimate() ? 1.2 : 1.0),
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
      ),
    );
  }
}
