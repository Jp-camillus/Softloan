import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Organisation/Details.dart';
import 'package:softloanapp/Widget/organisationdetails.dart';

class Ogdashboard extends StatefulWidget {
  const Ogdashboard({super.key});

  @override
  State<Ogdashboard> createState() => _OgdashboardState();
}

class _OgdashboardState extends State<Ogdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 0.02.sh),
            ),
            Text(
              'UNN Chitis',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  colors: [
                                    Colors.tealAccent,
                                    colors.Appcolors
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.02.sh),
                                  topRight: Radius.circular(0.02.sh)),
                              color: Color.fromARGB(44, 113, 250, 236)),
                        )),
                    Center(
                      child: Text(
                        ' UNN CHITIS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 0.05.sh),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Text('People that applied for loan'),
              SizedBox(
                height: 0.01.sh,
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 4,
                childAspectRatio: 0.0011.sh,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  8,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(
                          transition: Transition.leftToRight, Ogdetailscreen());
                    },
                    child: Container(
                      height: 0.2.sh,
                      width: 0.4.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.008.sh),
                        color: Color.fromARGB(8, 0, 150, 135),
                      ),
                      child: Column(
                        children: [
                          Image(
                              fit: BoxFit.contain,
                              image: AssetImage(Appimages.worker)),
                          Text(
                            'Emeka camillus',
                            style: TextStyle(
                                fontSize: 0.025.sh,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Flutter developer',
                            style: TextStyle(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.verify,
                                color: Colors.green,
                              ),
                              Text(
                                'Verified',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: 0.05.sh,
                          //   width: 0.4.sw,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(0.02.sh),
                          //       color: colors.Appcolors),
                          //   child: Text(
                          //     'Verify',
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
