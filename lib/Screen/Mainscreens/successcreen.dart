import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Successcreen extends StatelessWidget {
  const Successcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Iconsax.verify,
              color: colors.Appcolors,
              size: 0.1.sh,
            ),
          ),
          Text(
            'Verification Complete',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.024.sh),
          ),
          Text('account verified succesfully'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButtonWisget(
              isActive: true,
              tittle: 'Back to dashboard',
              ontap: () {
                Get.offAll(BottomNav());
              },
            ),
          )
        ],
      ),
    );
  }
}
