import 'package:flutter/material.dart';

extension ImageExtension on Image {

  Widget get paddingAll => Padding(
        padding: const EdgeInsets.all(8),
        child: this,
      );
      
}
