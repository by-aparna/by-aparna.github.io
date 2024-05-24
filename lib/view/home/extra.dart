import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/color.dart';
import '../../res/dimens.dart';
import '../../res/font_styles.dart';
import '../../res/strings.dart';
import '../utils/responsive.dart';

import 'package:flutter/material.dart';

class AnimatedEmojiPage extends StatefulWidget {
  @override
  _AnimatedEmojiPageState createState() => _AnimatedEmojiPageState();
}

class _AnimatedEmojiPageState extends State<AnimatedEmojiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationController.forward();
  }

  void _animateOnHover() {
    int animationCount = 0;

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationCount++;
        if (animationCount < 5) {
          animationController.forward();
        }
      }
    });

    animationController.forward(from: 0.0);
  }

  Widget _animatedEmoji() {
    return ScaleTransition(
      scale: animationController,
      child: Icon(
        Icons.emoji_emotions,
        size: 60,
        color: Colors.yellow,
      ),
    );
  }

  Widget _intros() {
    return MouseRegion(
      onEnter: (event) {
        _animateOnHover();
      },
      onExit: (event) => animationController.stop(canceled: true),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _animatedEmoji(),
              ),
              const SizedBox(width: 8),
              _helloText(),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Your profession here', // replace with Strings.intro_prof
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Your location here', // replace with Strings.intro_loc
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _helloText() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        Text(
          'Hello, I\'m  ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            // Handle click event
          },
          child: Text(
            'Aparna Chatterjee.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _intros(),
      ),
    );
  }
}
