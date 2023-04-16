import 'package:flutter/material.dart';
import 'package:modrabl/modrabl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Modrabl Example'),),
      body: Column(

        children: [
          Container(
            width: context.width,
            height: 50,
            color: Colors.orange,
          ),
          context.spacerHeight,
          Container(
            width: context.width,
            height: 50,
            color: Colors.yellow,
          ),
          context.spacerHeight,
          Container(
            width: context.width,
            height: 50,
            color: Colors.red,
          ),
          context.spacerHeight,
          Container(
            width: context.width,
            height: 50,
            color: Colors.blue,
          ),
          context.spacerHeight,
        ],
      ).paddingAll
    );
  }
}
