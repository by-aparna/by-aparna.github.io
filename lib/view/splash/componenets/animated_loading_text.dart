import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:flutter/material.dart';

import '../../../res/font_styles.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.defaultPadding * 5,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 2500),
        builder: (context, value, child) => Column(
          children: [
            const SizedBox(
              height: Dimens.defaultPadding / 2,
            ),
            LinearProgressIndicator(
              backgroundColor: MyColors.homeBackground,
              color: Colors.deepPurpleAccent,
              value: value,
            ),
            const SizedBox(
              height: Dimens.defaultPadding / 2,
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: MyTxtStyles.local_buttonTextStyle(context).copyWith(color: Colors.white),
            ),
          ],
        ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
