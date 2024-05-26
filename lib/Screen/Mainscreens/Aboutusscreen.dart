import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';

class AboutUsscreen extends StatefulWidget {
  const AboutUsscreen({super.key});

  @override
  State<AboutUsscreen> createState() => _AboutUsscreenState();
}

class _AboutUsscreenState extends State<AboutUsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text('About us'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(0.02.sh)),
              padding: EdgeInsets.all(0.01.sh),
              height: 0.3.sh,
              width: 1.sw,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.flash,
                        size: 0.055.sh,
                        color: Colors.white,
                      ),
                      Text(
                        'SOFT LOAN',
                        style: GoogleFonts.daiBannaSil(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.03.sh,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Image(
                      height: 0.32.sh,
                      width: 0.52.sw,
                      fit: BoxFit.cover,
                      image: AssetImage(Appimages.aboutus))
                ],
              ),
            ),
            SizedBox(
              height: 0.01.sh,
            ),
            Container(
                padding: EdgeInsets.all(0.015.sh),
                color: Colors.white,
                height: 0.12.sh,
                width: 1.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Terms and condition'),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Privacy policy'),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
