import 'package:flutter/material.dart';

class Sizes {
  Sizes._();

  double _width = 0;
  double _height = 0;

  static final Sizes _instance = Sizes._();

  static const Size _designSize = Size(414.0, 896.0);

  factory Sizes() => _instance;

  double get width => _width;
  double get height => height;

  static void init(
    BuildContext context, {
      Size designSize = _designSize,
    }
  ){
    final deviceData = MediaQuery.maybeOf(context);

    final deviceSize = deviceData?.size ?? _designSize;
  }
}