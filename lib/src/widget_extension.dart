import 'package:flutter/material.dart';

extension WidgetExtension on Widget {}

extension WidgetPaddingExtension on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget get borderNormal => Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: this)
      .paddingAll(8.0);
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
  Widget bottomDivider (Color color) => Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: color))
    ),
    child: this,
  );
}

extension SingleChildExtension on Widget {
  Widget get singleChildScrollView => SingleChildScrollView(
    child: this,
  );
}