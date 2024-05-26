import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Waitingforapprovalscreen extends StatelessWidget {
  const Waitingforapprovalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Iconsax.clock,
              color: Colors.yellow,
              size: 0.08.sh,
            ),
          ),
          Text(
            'Waiting for Approval',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.024.sh),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                'The payment will reflect on your dashbord once it is veryfied'),
          ),
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
