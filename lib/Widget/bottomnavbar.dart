import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get_core/get_core.dart';

import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/Profile.dart';
import 'package:softloanapp/Screen/Mainscreens/dashboard.dart';
import 'package:softloanapp/Screen/Mainscreens/history.dart';
import 'package:softloanapp/Screen/Mainscreens/loanscreen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Dashboardscreen(),
    Activeloanscreen(),
    Profilescreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      // If the "Logout" icon is pressed
      showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // Adjust the opacity as needed
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    height: 0.35.sh,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.3.sw,
                            height: 0.15.sh,
                            decoration: BoxDecoration(),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(Appimages.thinking),
                            ),
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 0.024.sh,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Are you sure you want to logout?'),
                            ],
                          ),
                          SizedBox(
                            height: 0.015.sh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Card(
                                  elevation: 20,
                                  shadowColor: Color.fromARGB(41, 76, 175, 79),
                                  child: Container(
                                    height: 0.053.sh,
                                    width: 0.3.sw,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(0.01.sh),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAll(Signinscreenscreen());
                                },
                                child: Card(
                                  elevation: 20,
                                  shadowColor: Color.fromARGB(41, 76, 175, 79),
                                  child: Container(
                                    height: 0.053.sh,
                                    width: 0.3.sw,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors.Appcolors,
                                      borderRadius:
                                          BorderRadius.circular(0.01.sh),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    } else {
      // If any other icon is pressed
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.bank),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.money),
            label: 'Active loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colors.Appcolors,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
