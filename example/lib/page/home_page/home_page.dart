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
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Modrabl Example'),),
      body: CheckConnectivity(
        child: Column(
          children: [
            const ImageNetwork(imageUrl: 'https://picsum.photos/200/300').center,
            context.spacerHeight,
            const ImageNetwork(imageUrl: 'https://picsum.photos/200/300'),
          ],
        ).paddingAll,
      )
    );
  }
}
