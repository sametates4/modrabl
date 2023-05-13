import 'package:flutter/material.dart';

extension WidgetExtension on Widget {}

extension WidgetPaddingExtension on Widget {
  Widget get paddingAll => Padding(
        padding: const EdgeInsets.all(8),
        child: this,
      );

  Widget get borderNormal => Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: this)
      .paddingAll;
}

extension CenterExtension on Widget {
  Widget get center => Center(
        child: this,
      );
}

extension ExpandedExtension on Widget {
  Widget get expanded => Expanded(child: this);
}

extension ContainerExtension on Widget {
  Widget get bottomDivider => Container(
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black26))
    ),
    child: this,
  );
}

extension SingleChildExtension on Widget {
  Widget get singleChildScrollView => SingleChildScrollView(
    child: this,
  );
}