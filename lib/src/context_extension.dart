import 'dart:math';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get appTheme => Theme.of(this);
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension SizedBoxExtension on BuildContext {
  Widget get spacerHeight => const SizedBox(
        height: 10,
      );
  Widget get spacerWidth => const SizedBox(
        width: 10,
      );
}

extension BuilderExtension on BuildContext {
  Widget get loading => const Center(
        child: CircularProgressIndicator(),
      );

  Widget get messageText => const Center(
        child: Text('Bir Hata ile Karşılaşıldı'),
      );
}
