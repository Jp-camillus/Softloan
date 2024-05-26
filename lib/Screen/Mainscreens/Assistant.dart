import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';

class Assistantscreen extends StatefulWidget {
  const Assistantscreen({super.key});

  @override
  State<Assistantscreen> createState() => _AssistantscreenState();
}

class _AssistantscreenState extends State<Assistantscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Assistant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chat with us directly on whatsapp',
              style: TextStyle(color: colors.Appcolors),
            ),
            Image(
              fit: BoxFit.fill,
              image: AssetImage(Appimages.supporticon3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chat with us',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Whatsapp',
                  style: TextStyle(color: colors.Appcolors),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Whatsapp',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.025.sh),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.message,
                    color: colors.Appcolors,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'We will respond to you within 1 hours',
                  style: TextStyle(color: colors.Appcolors),
                ),
              ],
            ),
            Text(
              '',
              style: TextStyle(color: colors.Appcolors),
            ),
          ],
        ),
      ),
    );
  }
}
