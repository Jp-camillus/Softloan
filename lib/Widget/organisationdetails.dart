import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Organisation/Ogdashboard.dart';

class Awaitingapprovalscreen extends StatelessWidget {
  const Awaitingapprovalscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Verification',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.025.sh),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 0.03.sh,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
