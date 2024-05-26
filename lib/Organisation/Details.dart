import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';

class Ogdetailscreen extends StatefulWidget {
  const Ogdetailscreen({super.key});

  @override
  State<Ogdetailscreen> createState() => _OgdetailscreenState();
}

class _OgdetailscreenState extends State<Ogdetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Verification'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.3.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.02.sh),
                  image: DecorationImage(image: AssetImage(Appimages.worker))),
            ),
            Text(
              'Camillus chidiofor',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 0.035.sh,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 0.013.sh,
            ),
            SizedBox(
              height: 0.032.sh,
            ),
            Row(
              children: [
                Text(
                  'personal details',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'First name',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'camillus',
                  style: TextStyle(
                      color: colors.Appcolors, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last name',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'Chidiofor',
                  style: TextStyle(
                      color: colors.Appcolors, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Surname',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'ugwu',
                  style: TextStyle(
                      color: colors.Appcolors, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Role',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'web developer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: colors.Appcolors),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              children: [
                Text('account details'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bank name',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'first bank',
                  style: TextStyle(
                      color: colors.Appcolors, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'account number',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  '09122328691',
                  style: TextStyle(
                      color: colors.Appcolors, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Beneficiary',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  'Ugwu camillus',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: colors.Appcolors),
                ),
              ],
            ),
            SizedBox(
              height: 0.01.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Salary earning',
                  style: TextStyle(fontSize: 0.015.sh),
                ),
                Text(
                  '100000',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: colors.Appcolors),
                ),
              ],
            ),
            SizedBox(
              height: 0.051.sh,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.01.sh)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(0.01.sh)),
                              height: 200.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      'Are you sure you want to verify',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Card(
                                          elevation: 10,
                                          shadowColor:
                                              Color.fromARGB(41, 76, 175, 79),
                                          child: Container(
                                            height: 0.053.sh,
                                            width: 0.32.sw,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Verify',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      0.01.sh),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Card(
                                          elevation: 10,
                                          shadowColor:
                                              Color.fromARGB(41, 76, 175, 79),
                                          child: Container(
                                            height: 0.053.sh,
                                            width: 0.32.sw,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Deny',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      0.01.sh),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      elevation: 10,
                      shadowColor: Color.fromARGB(41, 76, 175, 79),
                      child: Container(
                        height: 0.053.sh,
                        width: 0.32.sw,
                        alignment: Alignment.center,
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(0.01.sh),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 10,
                      shadowColor: Color.fromARGB(41, 76, 175, 79),
                      child: Container(
                        height: 0.053.sh,
                        width: 0.32.sw,
                        alignment: Alignment.center,
                        child: Text(
                          'Deny',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0.01.sh),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
