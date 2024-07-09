import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as enc;

import 'constants/string_constants.dart';
import 'utility/page_animation/slider_route.dart';

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

extension DeviceOSExtension on BuildContext {
  bool get isAndroidDevice => Platform.isAndroid;
  bool get isIOSDevice => Platform.isIOS;
  bool get isWindowsDevice => Platform.isWindows;
  bool get isLinuxDevice => Platform.isLinux;
  bool get isMacOSDevice => Platform.isMacOS;
}

extension SizedBoxExtension on BuildContext {
  Widget get spacerHeight => const SizedBox(
        height: 10,
      );

  Widget get spacerWidth => const SizedBox(
        width: 10,
      );
}

extension DividerExtension on BuildContext {
  Widget divider (Color color) => Container(
    width: width,
    height: 1,
    decoration: BoxDecoration(
      border: Border.all(color: color)
    ),
  );
}

extension BuilderExtension on BuildContext {
  Widget get loading => const Center(
        child: CircularProgressIndicator(),
      );

  Widget get error => const Center(
        child: Text(errorHasOccurred),
      );

  Widget get empty => const Center(
        child: Text(emptyContent),
      );
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);

  Future<bool> pop<T extends Object?>([T? data]) async {
    return navigation.maybePop(data);
  }

  void popWithRoot() => Navigator.of(this, rootNavigator: true).pop();

  Future<T?> navigateName<T extends Object?>(
    String path, {
    Object? data,
  }) async {
    return navigation.pushNamed<T>(path, arguments: data);
  }

  Future<T?> navigateToReset<T extends Object?>(
    String path, {
    Object? data,
  }) async {
    return navigation.pushNamedAndRemoveUntil(
      path,
      (route) => false,
      arguments: data,
    );
  }

  Future<T?> navigateToPage<T extends Object?>(
    Widget page, {
    Object? extra,
    SlideType type = SlideType.DEFAULT,
  }) async {
    return navigation
        .push<T>(type.route(page, RouteSettings(arguments: extra)));
  }
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highRadius => Radius.circular(width * 0.1);
}

extension SheetExtension on BuildContext {
  Future modalBottomSheet({required Widget child, required bool isScroll}) => showModalBottomSheet(
        context: this,
        enableDrag: isScroll,
        builder: (context) {
          return child;
        },
      );
}

extension EncryptExtension on BuildContext {
  String encrypt ({required String cryptoKey, required String cryptoIv, required String text}) {
    final key = enc.Key.fromBase64(cryptoKey);
    final iv = enc.IV.fromBase64(cryptoIv);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decrypt ({required String cryptoKey, required String cryptoIv, required String text}) {
    final key = enc.Key.fromBase64(cryptoKey);
    final iv = enc.IV.fromBase64(cryptoIv);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final solved = encrypter.decrypt64(text, iv: iv);
    return solved;
  }
}