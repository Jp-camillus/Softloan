import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Screen/Mainscreens/waitingforapprovalscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Repayloanscreen extends StatefulWidget {
  const Repayloanscreen({super.key});

  @override
  State<Repayloanscreen> createState() => _RepayloanscreenState();
}

class _RepayloanscreenState extends State<Repayloanscreen> {
  String firstAccount = '9122329898';
  String secondAccount = '3192156159';
  void copyfirstToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: firstAccount));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.green,
          content: Text('Copied $firstAccount to Clipboard')),
    );
  }

  void copysecondToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: secondAccount));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.green,
          content: Text('Copied $secondAccount to Clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Repay loan',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 0.034.sh),
              ),
              SizedBox(
                height: 0.05,
              ),
              Text(
                'Please transfer the amount of ₦25,000 to any of this account details to repay your loan',
              ),
              SizedBox(
                height: 0.03.sh,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.03.sh)),
                child: Container(
                  height: 0.23.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.03.sh)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: Image(
                          height: 0.04.sh,
                          image: AssetImage(Appimages.firstbank),
                        ),
                        title: Text('Bank'),
                        trailing: Text(
                          'First Bank',
                          style: TextStyle(fontSize: 0.02.sh),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.dialpad_outlined,
                          color: colors.Appcolors,
                        ),
                        title: Text('Account number'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              firstAccount,
                              style: TextStyle(
                                  fontSize: 0.02.sh, color: Colors.green),
                            ),
                            GestureDetector(
                              onTap: () {
                                copyfirstToClipboard(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 0.035.sh,
                                width: 0.15.sw,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(0.02.sh),
                                    border:
                                        Border.all(color: colors.Appcolors)),
                                child: Text(
                                  'Copy',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person_pin_outlined,
                          color: colors.Appcolors,
                        ),
                        title: Text('Beneficiary'),
                        trailing: Text(
                          'Softloan',
                          style: TextStyle(fontSize: 0.02.sh),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.03.sh)),
                child: Container(
                  height: 0.23.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.03.sh)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: Image(
                          height: 0.04.sh,
                          image: AssetImage(Appimages.zenith),
                        ),
                        title: Text('Bank'),
                        trailing: Text(
                          'GTB Bank',
                          style: TextStyle(fontSize: 0.02.sh),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.dialpad_outlined,
                          color: colors.Appcolors,
                        ),
                        title: Text('Account number'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              secondAccount,
                              style: TextStyle(
                                  fontSize: 0.02.sh, color: Colors.green),
                            ),
                            GestureDetector(
                              onTap: () {
                                copysecondToClipboard(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 0.035.sh,
                                width: 0.15.sw,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(0.02.sh),
                                    border:
                                        Border.all(color: colors.Appcolors)),
                                child: Text(
                                  'Copy',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person_pin_outlined,
                          color: colors.Appcolors,
                        ),
                        title: Text('Beneficiary'),
                        trailing: Text(
                          'Softloan',
                          style: TextStyle(fontSize: 0.02.sh),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Text(
                      'If you have made the payment click the button below to verify'),
                ),
              ),
              CustomButtonWisget(
                isActive: true,
                tittle: 'Confirm',
                ontap: () {
                  Get.to(
                      transition: Transition.fadeIn,
                      Waitingforapprovalscreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
