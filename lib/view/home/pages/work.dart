import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:aparna_chatterjee/view/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/experience_card.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  int _isHovered = -1;

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
        MouseRegion(
          onHover: (_) => setState(() => _isHovered = 0),
          onEnter: (_) => setState(() => _isHovered = 0),
          onExit: (_) => setState(() => _isHovered = -1),
          child: ExperienceCard(
            isHovered: _isHovered == 0,
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
        ),
        const SizedBox(height: 56),
        MouseRegion(
          onHover: (_) => setState(() => _isHovered = 1),
          onEnter: (_) => setState(() => _isHovered = 1),
          onExit: (_) => setState(() => _isHovered = -1),
          child: ExperienceCard(
            isHovered: _isHovered == 1,
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double margin = Responsive.isLargeMobile(context)
        ? 20
        : Responsive.isTablet(context)
            ? 40
            : 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _workpage(),
        SizedBox(height: margin),
      ],
    );
  }
}
