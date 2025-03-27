part of '../size_setter.dart';

extension ContextUtils on BuildContext {
  /// It returns screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// It returns screen width

  double get screenWidth => MediaQuery.of(this).size.width;
}

extension ResponsiveSize on num {
  /// It coverts pixels to resposive height
  double get h => Utils.getScreenHeight(Utils.ctx!, (this*Utils.offset!));

  /// It coverts pixels to resposive width

  double get w => Utils.getScreenWidth(Utils.ctx!, (this*Utils.offset!));

  /// It coverts pixels to percentage height

  double get ph {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );

    return (((Utils.ctx!.screenHeight)) * (this*Utils.offset!) / 100);
  }

  /// It coverts pixels to percentage width

  double get pw {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );

    return ((Utils.ctx!.screenWidth)) * (this*Utils.offset!) / 100;
  }

  /// It returns responsive fot size in pixels

  double get px => Utils.getpixelFontSize(Utils.ctx!, (this*Utils.offset!));

  /// It returns responsive fot size in scalar independent pixels

  double get sp => Utils.getSpFontSize(Utils.ctx!, (this*Utils.offset!));
}

extension PercentageSizeBoxExtension on num {
  /// It returns percentage Gap based on respective width value

  Widget get pWidthBox {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );
    return SizedBox(width: Utils.ctx!.screenWidth * ((this*Utils.offset!)) / 100);
  }

  /// It returns percentage Gap based on respective height value

  Widget get pHeightBox {
    assert(
      this > 0 && this <= 100,
      'The value must be between 0 to 100',
    );
    return SizedBox(height: Utils.ctx!.screenHeight * ((this*Utils.offset!)) / 100);
  }
}
