import 'package:flutter/material.dart';

class AppSize {
  static const double kProfileToolBarHeight = 220;
  static const double kButtonHeight = 60;
  static const int kMessageFieldMaxLine = 3;
  static const int kMobileNumberDigits = 10;

  static EdgeInsetsGeometry getMarginAll({required double margin}) {
    return EdgeInsets.all(margin);
  }

  static EdgeInsetsGeometry getMarginSymmetric(
      {double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
        horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0);
  }

  static EdgeInsetsGeometry getMarginOnly(
      {double? left, double? right, double? top, double? bottom}) {
    return EdgeInsets.only(
        left: left ?? 0.0,
        right: right ?? 0.0,
        top: top ?? 0.0,
        bottom: bottom ?? 0.0);
  }

  /// Constructs a circular radius. [x] and [y] will have the same radius value.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/radius_circular.png#gh-light-mode-only)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/radius_circular_dark.png#gh-dark-mode-only)
  static Radius getRadius({double? doubleRadius}) {
    return Radius.circular(doubleRadius!);
  }

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  static BorderRadius getBorderRadiusOnly(
      {double? topLeft,
      double? topRight,
      double? bottomLeft,
      double? bottomRight}) {
    return BorderRadius.only(
      topLeft: getRadius(doubleRadius: topLeft ?? 0.0),
      topRight: getRadius(doubleRadius: topRight ?? 0.0),
      bottomLeft: getRadius(doubleRadius: bottomLeft ?? 0.0),
      bottomRight: getRadius(doubleRadius: bottomRight ?? 0.0),
    );
  }

  /// Creates a border radius where all radii are [radius].
  static BorderRadius getBorderRadiusAll({double? doubleRadius}) {
    return BorderRadius.all(
      getRadius(doubleRadius: doubleRadius ?? 0.0),
    );
  }

  /// Creates a border radius where all radii are [Radius.circular(radius)].
  static BorderRadius getBorderRadiusCircular({double? doubleRadius}) {
    return BorderRadius.circular(doubleRadius ?? 0.0);
  }
}
