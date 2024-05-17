import 'dart:ui';

import 'package:aparna_chatterjee/res/color.dart';
import 'package:flutter/material.dart';

extension TextStyleX on TextStyle {
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    // Check if the existing decoration contains underline
    final bool hasUnderline =
        decoration != null && decoration!.contains(TextDecoration.underline);

    // Combine existing decoration with underline if it doesn't already contain underline
    final TextDecoration newDecoration = hasUnderline
        ? decoration! // If already underlined, keep the existing decoration
        : TextDecoration.combine([decoration ?? TextDecoration.none, TextDecoration.underline]);

    return copyWith(
      shadows: <Shadow>[
        Shadow(
          color: color ?? this.color ?? MyColors.highlightTxtColor,
          offset: Offset(0, -distance),
        ),
        ...(shadows ?? []),
      ],
      color: Colors.transparent,
      decoration: newDecoration,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}
