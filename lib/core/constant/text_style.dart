import 'package:flutter/material.dart';

import 'color_constant.dart';

class TextStyleClass {
  static TextStyle? titleBold({Color? color, double? size}) {
    return TextStyle(
      color: color ?? ColorConst.labelPrimaryColor,
      fontSize: size ?? 14.0,
      fontWeight: FontWeight.bold,
    );
  }
}
