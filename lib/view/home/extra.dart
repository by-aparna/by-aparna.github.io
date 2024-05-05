//
// Widget _intros() {
//   return Padding(
//     padding: const EdgeInsets.only(right: 100),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 12),
//               child: MouseRegion(
//                 onHover: (event) {
//                   controller.forward();
//                   controller.addStatusListener((status) {
//                     if (status == AnimationStatus.completed) {
//                       controller.reverse();
//                     }
//                   });
//                 },
//                 onExit: (event) {
//                   controller.stop(canceled: true);
//                 },
//                 child: AnimatedEmoji(
//                   AnimatedEmojis.wave,
//                   size: 60,
//                   controller: controller,
//                   onLoaded: (duration) {
//                     controller.duration = duration;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Hello, I\'m  ',
//                 style: MyTxtStyles.headingTextStyle.copyWith(
//                   color: MyColors.secondaryTxtColor,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: 'Aparna Chatterjee.',
//                     style: MyTxtStyles.headingTextStyle
//                         .copyWith(
//                           color: MyColors.secondaryTxtColor,
//                           fontWeight: FontWeight.w700,
//                         )
//                         .underlined(
//                             distance: 4, style: TextDecorationStyle.dashed),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: Dimens.defaultPadding,
//         ),
//         Text(
//           Strings.intro_prof,
//           style: MyTxtStyles.headingTextStyle
//               .copyWith(color: MyColors.highlightTxtColor),
//         ),
//         const SizedBox(
//           height: Dimens.defaultPadding,
//         ),
//         Text(
//           Strings.intro_loc,
//           style: MyTxtStyles.primaryTextStyle
//               .copyWith(color: MyColors.secondaryTxtColor),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _experienceCard(
//     {required String title,
//     required String description,
//     required List<Widget> tagList,
//     required Color descriptionBgColor,
//     required Color assetBgColor,
//     required Color cardBorderColor,
//     required Image image,
//     required SvgPicture logoImg}) {
//   double width = MediaQuery.of(context).size.width;
//   return Container(
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: cardBorderColor,
//       ),
//       borderRadius: const BorderRadius.all(
//         Radius.circular(14),
//       ),
//     ),
//     constraints: const BoxConstraints(
//       minHeight: 500,
//     ),
//     width: width * .76,
//     child: Row(
//       children: [
//         Expanded(
//           flex: 10,
//           child: Container(
//             color: descriptionBgColor,
//             padding: const EdgeInsets.only(
//               left: 32,
//               right: 24,
//               top: 156,
//               bottom: 156,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: MyTxtStyles.headingTextStyle
//                       .copyWith(color: MyColors.highlightTxtColor),
//                 ),
//                 const SizedBox(
//                   height: Dimens.defaultPadding,
//                 ),
//                 Text(
//                   description,
//                   style: MyTxtStyles.primaryTextStyle
//                       .copyWith(color: MyColors.secondaryTxtColor),
//                 ),
//                 const SizedBox(
//                   height: Dimens.defaultPadding,
//                 ),
//                 Wrap(
//                   clipBehavior: Clip.hardEdge,
//                   children: tagList.map((tag) {
//                     return Padding(
//                         padding: const EdgeInsets.only(
//                             right: Dimens.defaultPadding),
//                         child: tag);
//                   }).toList(),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 11,
//           child: Container(
//             decoration: BoxDecoration(
//               color: assetBgColor,
//               border: Border.all(
//                 color: cardBorderColor,
//               ),
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(14),
//                 bottomRight: Radius.circular(14),
//               ),
//             ),
//             constraints: const BoxConstraints(
//               minHeight: 500,
//             ),
//             child: SizedBox(
//               width: 440,
//               height: 515,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 100,
//                     left: 100,
//                     child: image,
//                   ),
//                   Positioned(
//                     top: -48,
//                     right: -38,
//                     child: ClipPath(
//                       clipper: EllipseClipper(),
//                       child: Container(
//                         color: Colors.white,
//                         width: 137,
//                         height: 110,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 6,
//                     top: 8,
//                     child: Container(
//                         constraints: BoxConstraints.tight(const Size(80, 32)),
//                         child: SizedBox(child: logoImg)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget _tag({
//   required String title,
//   required Color titleColor,
//   required Color borderColor,
//   required Gradient gradient,
// }) {
//   return Container(
//     constraints:
//         const BoxConstraints(minHeight: 32, minWidth: 150, maxWidth: 180),
//     padding: const EdgeInsets.symmetric(
//       horizontal: 6,
//       vertical: 2,
//     ),
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: borderColor,
//         width: 0.6,
//       ),
//       borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
//       gradient: gradient,
//     ),
//     child: Center(
//         child: Text(
//       title,
//       style: MyTxtStyles.buttonTextStyle.copyWith(
//         color: titleColor,
//       ),
//     )),
//   );
// }

// Widget _workpage() {
//   return Column(
//     children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           Strings.lbl_exp,
//           style: MyTxtStyles.primaryTextStyle
//               .copyWith(color: MyColors.secondaryTxtColor),
//         ),
//       ),
//       const SizedBox(
//         height: 16,
//       ),
//       _experienceCard(
//           title: 'Batch Swap',
//           description:
//               'Batch swapping enables users to exchange multiple tokens in a single transaction.',
//           tagList: [
//             _tag(
//                 title: 'Product Design',
//                 titleColor: const Color(0xFF99C2FF),
//                 borderColor: const Color(0xff2966C2),
//                 gradient: LinearGradient(colors: [
//                   const Color(0xff00407a).withOpacity(0.2),
//                   const Color(0xff56aaf7).withOpacity(0.2),
//                 ])),
//             _tag(
//               title: 'Brand Design',
//               titleColor: const Color(0xFFFFA279),
//               borderColor: const Color(0xFFC25729),
//               gradient: LinearGradient(colors: [
//                 const Color(0xff7a3300).withOpacity(0.2),
//                 const Color(0xfff79056).withOpacity(0.2),
//               ]),
//             ),
//           ],
//           cardBorderColor: const Color(0xFF424247),
//           descriptionBgColor: const Color(0xFF020309).withOpacity(.1),
//           assetBgColor: const Color(0xFF65CDA8),
//           image: Image.asset(
//             '${FilePath.assetPath}batch_swap.png',
//           ),
//           logoImg: SvgPicture.asset(
//             '${FilePath.assetPath}dzap.svg',
//             width: 78,
//             height: 22,
//           )),
//       const SizedBox(
//         height: 56,
//       ),
//       _experienceCard(
//         title: 'Investor Dashboard, Staking',
//         description:
//             'A tool for investors to track their token allocations, vesting schedule & claimable tokens in all the funding rounds.',
//         tagList: [
//           _tag(
//             title: 'Product Re-Design',
//             titleColor: const Color(0xFF99FFA9),
//             borderColor: const Color(0xff48C229),
//             gradient: LinearGradient(
//               colors: [
//                 const Color(0xff207a00).withOpacity(0.2),
//                 const Color(0xff56f7ee).withOpacity(0.2),
//               ],
//             ),
//           ),
//         ],
//         cardBorderColor: const Color(0xFF424247),
//         descriptionBgColor: const Color(0xFF020309).withOpacity(.1),
//         assetBgColor: const Color(0xFF9382FF),
//         image: Image.asset(
//           '${FilePath.assetPath}staking.png',
//         ),
//         logoImg: SvgPicture.asset('${FilePath.assetPath}propel.svg'),
//       ),
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../res/path.dart';
import '../utils/responsive.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout Example'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // If the width is less than 480, use a column layout
            final isMobile = constraints.maxWidth < 600;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              height: 500, // Minimum height
              child: isMobile
                  ? _buildColumnLayout() // Column layout for small screens
                  : _buildRowLayout(), // Row layout for larger screens
            );
          },
        ),
      ),
    );
  }

  Widget _buildRowLayout() {
    return Row(
      children: [
        Expanded(
          flex: 4, // 40% width
          child: Center(
            child: Text(
              'Section 1 - Text Row',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 6, // 60% width
          child: _buildImageSection(),
        ),
      ],
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      children: [
        Expanded(
          flex: 1, // Adjust flex for proper scaling
          child: Center(
            child: Text(
              'Section 1 - Text Column',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 1, // Adjust flex for proper scaling
          child: _buildImageSection(),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      // Ensure the images are clipped to rounded corners
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              '${FilePath.imgAssetPath}batch_swap.png',
              // Replace with your asset
              fit: BoxFit.cover, // Cover the entire space
            ),
          ),
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 237, // Ellipse width
              height: 110, // Ellipse height
              decoration: BoxDecoration(
                color: Colors.red, // Background color
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), // Top left radius
                  topRight: Radius.circular(55), // Top right radius
                  bottomLeft: Radius.circular(550), // Bottom left radius
                  bottomRight: Radius.circular(150), // Bottom right radius
                ),
              ),
              child: SvgPicture.asset(
                '${FilePath.imgAssetPath}dzap.svg',
                width: 78,
                height: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
