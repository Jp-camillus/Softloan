import 'package:flutter/material.dart';
import 'package:softloanapp/Loadingindicator/loading.dart';

class Noscreen extends StatelessWidget {
  const Noscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Loadingindicator(),
      ),
    );
  }
}
