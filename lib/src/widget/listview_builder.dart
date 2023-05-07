import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ListViewBuilder<T> extends SingleChildStatelessWidget {
  const ListViewBuilder({
    Key? key,
    required this.list,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final List<T> list;
  final Widget Function( T value ) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => builder(list[index])
    );
  }
}