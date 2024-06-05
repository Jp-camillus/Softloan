import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softloanapp/Constant/images.dart';

class Loadingindicator extends StatelessWidget {
  const Loadingindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          Center(child: Image(image: AssetImage(Appimages.loadingindicator2))),
    );
  }
}
