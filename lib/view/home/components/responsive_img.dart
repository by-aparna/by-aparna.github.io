import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final Image image;
  final double aspectRatio;

  const ResponsiveImage({
    super.key,
    required this.image,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Constrain the width between the min and max values
        double width = constraints.maxWidth;
        if (width < constraints.minWidth) {
          width = constraints.minWidth;
        } else if (width > constraints.maxWidth) {
          width = constraints.maxWidth;
        }

        // Calculate the height based on the aspect ratio
        double height = width / aspectRatio;
        return SizedBox(width: width, height: height, child: image);
      },
    );
  }
}
