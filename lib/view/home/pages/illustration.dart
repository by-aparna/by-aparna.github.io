import 'package:aparna_chatterjee/res/dimens.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:aparna_chatterjee/res/strings.dart';
import 'package:flutter/material.dart';

class Illustrations extends StatelessWidget {
  const Illustrations({super.key});

  Widget _page_divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(
        thickness: 1,
        color: Color(0xFF505050),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Strings.lbl_wed_illus,
            style: MyTxtStyles.local_headingStyle(context)
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: Dimens.defaultPadding),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.spaceBetween,
          spacing: 48,
          runSpacing: 16,
          children: [
            Image.asset(
              '${FilePath.imgAssetPath}illus1.png',
            ),
            Image.asset(
              '${FilePath.imgAssetPath}illus2.png',
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const Divider(),
        const SizedBox(height: Dimens.defaultPadding),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Strings.lbl_prj_illus,
            style: MyTxtStyles.local_primaryTextStyle(context)
                .copyWith(fontSize: 30, color: Colors.white),
          ),
        ),
        const SizedBox(height: Dimens.defaultPadding),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 24,
          runSpacing: 24,
          children: [
            SizedBox(
              width: 426,
              child: Image.asset(
                '${FilePath.imgAssetPath}illus3.png',
              ),
            ),
            SizedBox(
              width: 666,
              child: Image.asset(
                '${FilePath.imgAssetPath}illus4.png',
              ),
            )
          ],
        ),
        _page_divider(),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 24,
          runSpacing: 24,
          children: [
            SizedBox(
              width: 426,
              child: Image.asset(
                '${FilePath.imgAssetPath}illus6.png',
              ),
            ),
            SizedBox(
              width: 666,
              child: Image.asset(
                '${FilePath.imgAssetPath}illus7.png',
              ),
            ),
          ],
        ),
        _page_divider(),
        Image.asset(
          '${FilePath.imgAssetPath}illus5.png',
        )
      ],
    );
  }
}
