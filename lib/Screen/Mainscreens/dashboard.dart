import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Requestloan/reasonforloan.dart';
import 'package:softloanapp/Screen/Mainscreens/Aboutusscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification.dart';
import 'package:softloanapp/Screen/Mainscreens/Assistant.dart';
import 'package:softloanapp/Screen/Mainscreens/Contactus.dart';
import 'package:softloanapp/Screen/Mainscreens/FAQscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/Repayscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/loanscreen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(8, 199, 240, 236),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'welcome,',
              style: TextStyle(fontSize: 0.02.sh),
            ),
            Text(
              'Tom Hanks',
              style: TextStyle(fontSize: 0.03.sh, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Card(
              elevation: 11,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.02.sh),
              ),
              child: Container(
                height: 0.24.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        colors.Appcolors,
                        const Color.fromARGB(255, 36, 196, 180),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(0.02.sh),
                    color: colors.Appcolors),
                child: Stack(children: [
                  Positioned(
                      left: 0.6.sw,
                      top: 0.05.sh,
                      bottom: 0,
                      right: 0.0,
                      child: Container(
                        width: 3.sw,
                        height: 0.08.sh,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                colors: [
                                  Colors.tealAccent,
                                  const Color.fromARGB(255, 36, 196, 180)
                                ]),
                            shape: BoxShape.circle,
                            color: Color.fromARGB(44, 113, 250, 236)),
                      )),
                  Positioned(
                      left: 0.7.sw,
                      top: 0,
                      bottom: 0.1.sh,
                      right: 0,
                      child: Container(
                        height: 0.1.sh,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                colors: [Colors.tealAccent, colors.Appcolors]),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.02.sh),
                                topRight: Radius.circular(0.02.sh)),
                            color: Color.fromARGB(44, 113, 250, 236)),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Eligible Loan Balance',
                              style: TextStyle(color: Colors.white),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'company',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Nonacode programming',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 0.015.sh),
                        Text(
                          '₦25,000',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 0.055.sh,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Click below to get a Loan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                        transition: Transition.leftToRight, Repayloanscreen());
                  },
                  child: Container(
                    height: 0.07.sh,
                    width: 0.45.sw,
                    alignment: Alignment.center,
                    child: Text(
                      'Repay loan',
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.02.sh),
                        border: Border.all(color: colors.Appcolors)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(transition: Transition.leftToRight, Reasonforlaon());
                  },
                  child: Container(
                    height: 0.07.sh,
                    width: 0.45.sw,
                    alignment: Alignment.center,
                    child: Text(
                      'Request loan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: colors.Appcolors,
                      borderRadius: BorderRadius.circular(0.02.sh),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Container(
                height: 0.11.sh,
                width: 0.99.sw,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  color: Color.fromARGB(6, 235, 2, 2),
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Center(
                  child: ListTile(
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          Get.to(
                            Accountverificationscreen(),
                          );
                        },
                        child: Text(
                          'verify',
                          style: TextStyle(color: Colors.white),
                        )),
                    title: Text('Action needed'),
                    subtitle: Text('please verify your account'),
                    leading: Image(image: AssetImage(Appimages.formicon)),
                  ),
                )),
            SizedBox(
              height: 0.01.sh,
            ),
            SizedBox(
              height: 0.01.sh,
            ),
            Container(
              height: 0.25.sh,
              width: 1.sw,
              padding: EdgeInsets.all(0.02.sw),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                              transition: Transition.leftToRight,
                              Reasonforlaon());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(Appimages.loanicon),
                              ),
                              Text('Loan')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                              transition: Transition.leftToRight,
                              Activeloanscreen());
                        },
                        child: Container(
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.bank,
                                size: 0.05.sh,
                                color: colors.Appcolors,
                              ),
                              Text('Repay')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                              transition: Transition.leftToRight,
                              AboutUsscreen());
                        },
                        child: Container(
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.flash,
                                size: 0.05.sh,
                                color: colors.Appcolors,
                              ),
                              Text('About us')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                              transition: Transition.leftToRight,
                              Contactusscreen());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.airdrop,
                                size: 0.05.sh,
                                color: colors.Appcolors,
                              ),
                              Text('Contact us')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                              transition: Transition.leftToRight,
                              Assistantscreen());
                        },
                        child: Container(
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.message,
                                size: 0.05.sh,
                                color: colors.Appcolors,
                              ),
                              Text('Assistant')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(FAQscreen());
                        },
                        child: Container(
                          height: 0.1.sh,
                          width: 0.28.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.message_question,
                                size: 0.05.sh,
                                color: colors.Appcolors,
                              ),
                              Text('FAQ')
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(26, 9, 90, 81),
                              borderRadius: BorderRadius.circular(0.02.sh)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
