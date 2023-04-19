import 'package:flutter/material.dart';
import 'package:modrabl/modrabl.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({super.key, required this.child});
  final Widget child;
  @override
  State<CheckConnectivity> createState() => _CheckConnectivityState();
}

class _CheckConnectivityState extends State<CheckConnectivity> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.checkConnectivity,
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return widget.child;
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/noConnection.jpg',
                package: 'modrabl',
              ),
              const Text('İnternet Bağlantınız Yok', style: TextStyle(
                fontSize: 20,
              ),),
              TextButton(
                child: const Text('Tekrar Dene'),
                onPressed: () async {
                  await context.checkConnectivity;
                  setState(() {});
                },
              )
            ],
          ).paddingAll;
        }
      },
    );
  }
}
