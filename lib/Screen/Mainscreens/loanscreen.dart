import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Mainscreens/Repayscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/history.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Activeloanscreen extends StatefulWidget {
  const Activeloanscreen({super.key});

  @override
  State<Activeloanscreen> createState() => _ActiveloanscreenState();
}

class _ActiveloanscreenState extends State<Activeloanscreen> {
  @override
  bool expandablecontainer = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Active loan',
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(transition: Transition.leftToRight, Historyscreen());
            },
            child: Row(
              children: [
                Icon(
                  Icons.history,
                ),
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 0.024.sh,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.1.sw,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    expandablecontainer = !expandablecontainer;
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 0.1.sh,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.01.sh)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Soft loan'),
                              Text('Payment amount')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Due date: 15th may, 2024'),
                              Text(
                                '₦60,000',
                                style: TextStyle(
                                    fontSize: 0.025.sh,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              if (expandablecontainer)
                Container(
                  alignment: Alignment.center,
                  height: 0.4.sh,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.01.sh)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Soft loan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 0.03.sh),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Loan Amount'), Text('₦50,000')],
                        ),
                        SizedBox(
                          height: 0.015.sh,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Loan Term'),
                              Text(
                                '3 months',
                              ),
                            ]),
                        SizedBox(
                          height: 0.015.sh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Interest'),
                            Text(
                              '₦10,000',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Repay amount'),
                            Text(
                              '₦60,000',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        CustomButtonWisget(
                          isActive: true,
                          tittle: 'Repay',
                          ontap: () {
                            Get.to(Repayloanscreen());
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
