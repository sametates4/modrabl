import 'package:example/page/home_page/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:modrabl/modrabl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, dynamic> info = {};

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  void getDeviceInfo() async {
      info = await context.checkDeviceInfo;
      debugPrint('${info['fingerprint']}/${info['id']}/${info['board']}');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Modrabl Example'),),
      body: CheckConnectivity(
        child: const AnimatedButton().center,
      )
    );
  }
}