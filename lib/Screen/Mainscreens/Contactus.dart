import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';

class Contactusscreen extends StatefulWidget {
  const Contactusscreen({super.key});

  @override
  State<Contactusscreen> createState() => _ContactusscreenState();
}

class _ContactusscreenState extends State<Contactusscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Contact us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              fit: BoxFit.fill,
              image: AssetImage(Appimages.customersupport),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.025.sh),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.phone,
                    color: colors.Appcolors,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '09122328691',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Call us',
                  style: TextStyle(color: colors.Appcolors),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.025.sh),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.email,
                    color: colors.Appcolors,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'softloan@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Send Email',
                  style: TextStyle(color: colors.Appcolors),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'We will respond to you within 24 hours',
                  style: TextStyle(color: colors.Appcolors),
                ),
              ],
            ),
            Text(
              'But if you want it faster head over to ASSISTANT and chat us on whatsapp',
              style: TextStyle(color: colors.Appcolors),
            ),
          ],
        ),
      ),
    );
  }
}
