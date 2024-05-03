import 'package:animated_emoji/animated_emoji.dart';
import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/utils/paint.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:aparna_chatterjee/view/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  Widget _intros() {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Column(
        children: [
          Row(
            children: [
              ResponsiveRowColumnItem(

                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: MouseRegion(
                    onHover: (event) {
                      controller.forward();
                      controller.addStatusListener((status) {
                        if (status == AnimationStatus.completed) {
                          controller.reverse();
                        }
                      });
                    },
                    onExit: (event) {
                      controller.stop(canceled: true);
                    },
                    child: AnimatedEmoji(
                      AnimatedEmojis.wave,
                      size: 60,
                      controller: controller,
                      onLoaded: (duration) {
                        controller.duration = duration;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
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
                            fontWeight: FontWeight.w700,
                          )
                          .underlined(
                              distance: 4, style: TextDecorationStyle.dashed),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.defaultPadding,
          ),
          Text(
            Strings.intro_prof,
            style: MyTxtStyles.local_headingStyle(context)
                .copyWith(color: MyColors.highlightTxtColor),
          ),
          const SizedBox(
            height: Dimens.defaultPadding,
          ),
          Text(
            Strings.intro_loc,
            style: MyTxtStyles.local_primaryTextStyle(context)
                .copyWith(color: MyColors.secondaryTxtColor),
          ),
        ],
      ),
    );
  }

  Widget _experienceCard(
      {required String title,
      required String description,
      required List<Widget> tagList,
      required Color descriptionBgColor,
      required Color assetBgColor,
      required Color cardBorderColor,
      required Image image,
      required SvgPicture logoImg}) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: cardBorderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      constraints: const BoxConstraints(
        minHeight: 500,
      ),
      width: width * .76,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              color: descriptionBgColor,
              padding: const EdgeInsets.only(
                left: 32,
                right: 24,
                top: 156,
                bottom: 156,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTxtStyles.local_headingStyle(context)
                        .copyWith(color: MyColors.highlightTxtColor),
                  ),
                  const SizedBox(
                    height: Dimens.defaultPadding,
                  ),
                  Text(
                    description,
                    style: MyTxtStyles.local_primaryTextStyle(context)
                        .copyWith(color: MyColors.secondaryTxtColor),
                  ),
                  const SizedBox(
                    height: Dimens.defaultPadding,
                  ),
                  Wrap(
                    clipBehavior: Clip.hardEdge,
                    children: tagList.map((tag) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              right: Dimens.defaultPadding),
                          child: tag);
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                color: assetBgColor,
                border: Border.all(
                  color: cardBorderColor,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              constraints: const BoxConstraints(
                minHeight: 500,
              ),
              child: SizedBox(
                width: 440,
                height: 515,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      left: 100,
                      child: image,
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
                          constraints: BoxConstraints.tight(Size(80, 32)),
                          child: SizedBox(child: logoImg)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        gradient: gradient,
      ),
      child: Center(
          child: Text(
        title,
        style: MyTxtStyles.local_buttonTextStyle(context).copyWith(
          color: titleColor,
        ),
      )),
    );
  }

  Widget _workpage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Strings.lbl_exp,
            style: MyTxtStyles.local_primaryTextStyle(context)
                .copyWith(color: MyColors.secondaryTxtColor),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _experienceCard(
            title: 'Batch Swap',
            description:
                'Batch swapping enables users to exchange multiple tokens in a single transaction.',
            tagList: [
              _tag(
                  title: 'Product Design',
                  titleColor: const Color(0xFF99C2FF),
                  borderColor: const Color(0xff2966C2),
                  gradient: LinearGradient(colors: [
                    const Color(0xff00407a).withOpacity(0.2),
                    const Color(0xff56aaf7).withOpacity(0.2),
                  ])),
              _tag(
                title: 'Brand Design',
                titleColor: const Color(0xFFFFA279),
                borderColor: const Color(0xFFC25729),
                gradient: LinearGradient(colors: [
                  const Color(0xff7a3300).withOpacity(0.2),
                  const Color(0xfff79056).withOpacity(0.2),
                ]),
              ),
            ],
            cardBorderColor: const Color(0xFF424247),
            descriptionBgColor: const Color(0xFF020309).withOpacity(.1),
            assetBgColor: const Color(0xFF65CDA8),
            image: Image.asset(
              '${FilePath.imgAssetPath}batch_swap.png',
            ),
            logoImg: SvgPicture.asset(
              '${FilePath.imgAssetPath}dzap.svg',
              width: 78,
              height: 22,
            )),
        const SizedBox(
          height: 56,
        ),
        _experienceCard(
          title: 'Investor Dashboard, Staking',
          description:
              'A tool for investors to track their token allocations, vesting schedule & claimable tokens in all the funding rounds.',
          tagList: [
            _tag(
              title: 'Product Re-Design',
              titleColor: const Color(0xFF99FFA9),
              borderColor: const Color(0xff48C229),
              gradient: LinearGradient(
                colors: [
                  const Color(0xff207a00).withOpacity(0.2),
                  const Color(0xff56f7ee).withOpacity(0.2),
                ],
              ),
            ),
          ],
          cardBorderColor: const Color(0xFF424247),
          descriptionBgColor: const Color(0xFF020309).withOpacity(.1),
          assetBgColor: const Color(0xFF9382FF),
          image: Image.asset(
            '${FilePath.imgAssetPath}staking.png',
          ),
          logoImg: SvgPicture.asset('${FilePath.imgAssetPath}propel.svg'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        _intros(),
        const SizedBox(
          height: 200,
        ),
        _workpage(),
        const SizedBox(
          height: 100,
        ),
      ],
    ));
  }
}
