// import 'dart:developer';

part of '../size_setter.dart';

abstract class Utils {
  static BuildContext? ctx;
  static double? width;
  static double? height;
  static double? offsetX;
  static double? offsetY;
  static void setSizers({
    required BuildContext context,
    required double setupWidth,
    required double setupHeight,
    required double setupOffsetX,
    required double setupOffsetY,
  }) {
    ctx = context;
    width = setupWidth;
    height = setupHeight;
    offsetX = setupOffsetX;
    offsetY = setupOffsetY;
  }

  static double getScreenWidth(BuildContext context, num y) {
    return context.screenWidth * (y / width!);
  }

  static double getEvenSize(
    BuildContext? context,
    num z,
  ) {
    return (context!.screenWidth * context.screenHeight) *
        (z / (width! * height!));
  }

  static double getScreenHeight(BuildContext context, num y) {
    // log("setup height $height");
    return context.screenHeight * (y / height!);
  }

  static double getpixelFontSize(
    BuildContext context,
    num referenceFontSize,
  ) {
    // Calculate scaling factors for width and height
    double widthScaleFactor = context.screenWidth / width!;
    double heightScaleFactor = context.screenHeight / height!;

    // Choose the smaller scaling factor to ensure the text fits within both dimensions
    double scaleFactor = widthScaleFactor < heightScaleFactor
        ? widthScaleFactor
        : heightScaleFactor;

    // Calculate the dynamic font size
    double dynamicFontSize = referenceFontSize * scaleFactor;

    return dynamicFontSize;
  }

  static double getSpFontSize(
    BuildContext context,
    num referenceFontSize,
  ) {
    // Intentionally ignore device accessibility text scaling and
    // keep app typography deterministic.
    const TextScaler scaler = TextScaler.linear(1.0);

    double widthScaleFactor = context.screenWidth / width!;
    double heightScaleFactor = context.screenHeight / height!;

    double scaleFactor = widthScaleFactor < heightScaleFactor
        ? widthScaleFactor
        : heightScaleFactor;

    double dynamicFontSize = scaler.scale(referenceFontSize * scaleFactor);

    return dynamicFontSize;
  }

  static double getFixedPercentFontSize(
    BuildContext context,
    num referenceFontSize,
  ) {
    // Convert design px (e.g. 20) into design-height percentage first,
    // then apply the same process as `.ph`.
    // percent = (px / sourceHeight) * 100
    final percent = (referenceFontSize / height!) * 100;
    return context.screenHeight * percent / 100;
  }
}
