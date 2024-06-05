import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Screen/Mainscreens/history.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  bool _youdetailpressed = true;
  bool _iscompanydetailpressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.5.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: colors.Appcolors,
                image: DecorationImage(
                  opacity: 0.8,
                  fit: BoxFit.cover,
                  image: AssetImage(Appimages.worker),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.07.sh,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 0.025.sh,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Ugwu Camillus',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.045.sh,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '09122328691',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _youdetailpressed = !_youdetailpressed;
                });
              },
              child: _youdetailpressed
                  ? Container(
                      height: 0.13.sh,
                      width: 1.sw,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Details',
                              style: TextStyle(fontSize: 0.025.sh),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Surname',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Ugwu',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 0.24.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Details',
                              style: TextStyle(fontSize: 0.025.sh),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Surname',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Ugwu',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'First name',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Camillus',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Last name',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'ifeanyichukwu',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobile number',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  '09122328691',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _iscompanydetailpressed = !_iscompanydetailpressed;
                });
              },
              child: _iscompanydetailpressed
                  ? Container(
                      height: 0.17.sh,
                      width: 1.sw,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company details',
                              style: TextStyle(fontSize: 0.025.sh),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Nanocode Programming',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Role',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Mobile developer',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 0.23.sh,
                      width: 1.sw,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company details',
                              style: TextStyle(fontSize: 0.025.sh),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Nanocode Programming',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Role',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  'Mobile developer',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Company no',
                                  style: TextStyle(
                                      fontSize: 0.025.sh,
                                      color: colors.Appcolors),
                                ),
                                Text(
                                  '08111586349',
                                  style: TextStyle(color: colors.Appcolors),
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
