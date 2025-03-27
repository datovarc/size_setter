library size_setter;

import 'dart:developer';

import 'package:flutter/material.dart';

part './helpers/extensions.dart';
part './helpers/dimens.dart';

abstract class SizeSetterUtils {
  static void setSourceDeviceSize({
    required BuildContext context,
    double sourceWidth = 400,
    double sourceHeight = 820,
    double sourceOffsetX = 1,
    double sourceOffsetY = 1,
  }) {
    /// Set Th value to common accessable variable
    Utils.setSizers(
        context: context, setupWidth: sourceWidth, setupHeight: sourceHeight, setupOffsetX: sourceOffsetX, setupOffsetY: sourceOffsetY);
  }
}

/// This Class which is used to initialize the  size_setter package from Stateless Widget
class SizeSetter extends StatelessWidget {
  const SizeSetter({
    super.key,
    required this.child,
    required this.sourceWidth,
    required this.sourceHeight,
    required this.sourceOffsetX,
    required this.sourceOffsetY,
  });
  final Widget child;
  final double sourceWidth;
  final double sourceHeight;
  final double sourceOffsetX;
  final double sourceOffsetY;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      /// This method is to initialize source Device size
      SizeSetterUtils.setSourceDeviceSize(context: context, sourceWidth: sourceWidth, sourceHeight: sourceHeight, sourceOffsetX: sourceOffsetX, sourceOffsetY: sourceOffsetY);
      return child;
    }));
  }
}
