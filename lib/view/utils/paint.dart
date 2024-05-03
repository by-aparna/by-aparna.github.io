
import 'package:flutter/material.dart';

class EllipseClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height)); // Create an oval path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}