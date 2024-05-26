import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Mainscreens/history.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(41, 216, 213, 213),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.3.sh,
              width: 1.sw,
              color: colors.Appcolors,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Your Details',
                    style: TextStyle(fontSize: 0.025.sh),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 0.2.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Surname',
                            style: TextStyle(
                                fontSize: 0.025.sh, color: colors.Appcolors),
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
                                fontSize: 0.025.sh, color: colors.Appcolors),
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
                                fontSize: 0.025.sh, color: colors.Appcolors),
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
                                fontSize: 0.025.sh, color: colors.Appcolors),
                          ),
                          Text(
                            '09122328691',
                            style: TextStyle(color: colors.Appcolors),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Company details',
                    style: TextStyle(fontSize: 0.025.sh),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 0.17.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 0.025.sh, color: colors.Appcolors),
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
                                fontSize: 0.025.sh, color: colors.Appcolors),
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
                                fontSize: 0.025.sh, color: colors.Appcolors),
                          ),
                          Text(
                            '08111586349',
                            style: TextStyle(color: colors.Appcolors),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Divider(),
                  Row(
                    children: [
                      Icon(Iconsax.logout),
                      Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  Container(
                    height: 0.08.sh,
                    padding: EdgeInsets.all(0.01.sh),
                    alignment: Alignment.center,
                    color: Colors.white,
                    width: 1.sw,
                    child: Text(
                      'if you want to edit your details contact our customer support',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
