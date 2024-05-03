import 'package:aparna_chatterjee/view/home/home.dart';
import 'package:aparna_chatterjee/view/home/pages/illustration.dart';
import 'package:aparna_chatterjee/view/home/pages/resume.dart';
import 'package:aparna_chatterjee/view/splash/splash_view.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Routes._();

  //static variables
  static const String init = '/';
  static const String home = '/home';
  static const String work = '/work';
  static const String resume = '/resume';
  static const String illustration = '/illustration';

  static final routes = <String, WidgetBuilder>{
    init: (BuildContext context) => const SplashView(),
    home: (BuildContext context) => const HomePage(),
    work: (BuildContext context) => const HomePage(),
    resume: (BuildContext context) => Resume(),
    illustration: (BuildContext context) => const Illustrations(),
  };
}
