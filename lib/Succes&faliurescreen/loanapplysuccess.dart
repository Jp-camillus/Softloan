import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Loansuccessscreen extends StatelessWidget {
  const Loansuccessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image(image: AssetImage(Appimages.congratulation3))),
            Text(
              'Application successful',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.024.sh),
            ),
            Text(
                'You will get a credit alert once your loan is approved by your organisation'),
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
      ),
    );
  }
}
