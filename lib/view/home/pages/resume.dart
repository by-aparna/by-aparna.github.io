import 'dart:async';

import 'package:aparna_chatterjee/res/color.dart';
import 'package:aparna_chatterjee/res/font_styles.dart';
import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../components/hoverbutton.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _currentIndex = 0;
  final List<ColorFilter> _filters = [
    const ColorFilter.mode(Colors.grey, BlendMode.color),
    const ColorFilter.matrix(<double>[
      0.393, 0.769, 0.189, 0, 0, 0.349, 0.686, 0.168, 0, 0, 0.272, 0.534, 0.131, 0, 0, 0, 0, 0, 1, 0,
    ]),
    const ColorFilter.mode(Colors.transparent, BlendMode.color),
  ];

  late Timer _timer;
  late Future<void> _imagePreload;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _imagePreload = _preloadImage();
  }

  Future<void> _preloadImage() async {
    await precacheImage(const AssetImage('${FilePath.imgAssetPath}me.jpeg'), context);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 700), (Timer timer) {
      if (_currentIndex == _filters.length - 1) {
        timer.cancel();
        return;
      }
      setState(() {
        _currentIndex = (_currentIndex + 1) % _filters.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLargeMobile = Responsive.isLargeMobile(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Meet Aparna',
              style: MyTxtStyles.local_headingStyle(context).copyWith(
                color: MyColors.highlightTxtColor,
              ),
            ),
            const SizedBox(height: 28),
            FutureBuilder(
              future: _imagePreload,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return isLargeMobile ? _mobileAboutMeLayout(context) : _desktopAboutMeLayout(context);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _mobileAboutMeLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: _buildImage(context)),
        const SizedBox(height: 16),
        _buildDescription(context),
      ],
    );
  }

  Widget _desktopAboutMeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildDescription(context)),
        const SizedBox(width: 26),
        _buildImage(context),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text.rich(
          TextSpan(
            text: 'I\'m a designer with deep ',
            style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
              color: MyColors.secondaryTxtColor,
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: MyTxtStyles.local_primaryFontSize(context),
                ),
              ),
              TextSpan(
                text:
                ' for the art of design. My journey began in architecture, where I learned to design physical spaces that blend beauty with functionality.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ),
              ),
              TextSpan(
                text:
                '\n\nOver time, my curiosity led me to explore the digital landscape. Fascinated by its possibilities, I ventured into crafting engaging experiences in the digital space.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ),
              ),
              TextSpan(
                text:
                '\n\nI\'m a self-taught designer, having delved into UX/UI and product design through workshops, blogs, and hands-on projects.',
                style: MyTxtStyles.local_primaryTextStyle(context).copyWith(
                  color: MyColors.secondaryTxtColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Align(
          alignment: Responsive.isLargeMobile(context)
              ? Alignment.center
              : Alignment.centerLeft,
          child: const HoverCardButton(),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    const double minSize = 240;
    const double maxSize = 400;
    double screenSize = MediaQuery.of(context).size.width * 0.25;
    double imageSize = screenSize.clamp(minSize, maxSize);
    // final double imageSize = max(MediaQuery.of(context).size.width * .25, 240);
    return ClipOval(
      child: SizedBox(
        height: imageSize,
        width: imageSize,
        child: ColorFiltered(
          colorFilter: _filters[_currentIndex],
          child: Image.asset(
            '${FilePath.imgAssetPath}me.jpeg',
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
