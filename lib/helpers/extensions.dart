part of '../size_setter.dart';

extension ContextUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height * MediaQuery.of(this).devicePixelRatio;
  double get screenWidth => MediaQuery.of(this).size.width * MediaQuery.of(this).devicePixelRatio;
}

extension ResponsiveSize on num {
  double get h => Utils.getScreenHeight(Utils.ctx!, (this * Utils.offsetY!)) * MediaQuery.of(Utils.ctx!).devicePixelRatio;
  double get w => Utils.getScreenWidth(Utils.ctx!, (this * Utils.offsetX!)) * MediaQuery.of(Utils.ctx!).devicePixelRatio;
  
  double get ph {
    assert(this > 0 && this <= 100, 'The value must be between 0 to 100');
    return ((Utils.ctx!.screenHeight) * (this * Utils.offsetY!) / 100) * MediaQuery.of(Utils.ctx!).devicePixelRatio;
  }

  double get pw {
    assert(this > 0 && this <= 100, 'The value must be between 0 to 100');
    return ((Utils.ctx!.screenWidth) * (this * Utils.offsetX!) / 100) * MediaQuery.of(Utils.ctx!).devicePixelRatio;
  }

  /// It returns responsive fot size in pixels

  double get px => Utils.getpixelFontSize(Utils.ctx!, (this*Utils.offsetY!));

  /// It returns responsive fot size in scalar independent pixels

  double get sp => Utils.getSpFontSize(Utils.ctx!, (this*Utils.offsetY!));
}


extension PercentageSizeBoxExtension on num {
  /// It returns percentage Gap based on respective width value

  Widget get pWidthBox {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );
    return SizedBox(width: Utils.ctx!.screenWidth * ((this*Utils.offsetX!)) / 100);
  }

  /// It returns percentage Gap based on respective height value

  Widget get pHeightBox {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );
    return SizedBox(height: Utils.ctx!.screenHeight * ((this*Utils.offsetY!)) / 100);
  }
}
