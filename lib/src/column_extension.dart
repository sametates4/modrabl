import 'package:flutter/material.dart';

extension ColumnExtension on Column {}

extension ColumnPaddingExtension on Column {
  Widget get paddingAll => Padding(
        padding: const EdgeInsets.all(10),
        child: this,
      );

  Widget get paddingBottom => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: this,
      );

  Widget get paddingTop => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: this,
      );
}
