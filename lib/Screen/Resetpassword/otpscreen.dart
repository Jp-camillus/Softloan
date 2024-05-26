import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Resetpassword/changepasswordscreen.dart';
import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phonenumbercontroller = TextEditingController();

  bool _isButtonEnabled = false;
  int _counter = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  void resendOTP() {
    // Add your logic here for resending OTP
    // For demo purpose, resetting counter to 30 seconds
    setState(() {
      _counter = 30;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            onChanged: _updateButtonState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Text(
                  'OTP verification',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                ),
                SizedBox(
                  height: 0.05,
                ),
                Text(
                  'please enter the code that was sent to 09122328691',
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
                Text('OTP code'),
                TextFeildWithNoIcon(
                  keyboardtype: TextInputType.number,
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else if (value.length != 6) {
                      return 'Invalid OTP';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: phonenumbercontroller,
                  Tittle: 'OTP',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Resend OTP in $_counter seconds',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.01.sh)),
                          backgroundColor: colors.Appcolors),
                      onPressed: _counter == 0 ? resendOTP : null,
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 0.03.sh,
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Verify',
                  isActive: _isButtonEnabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState!.validate();
    });
  }

  void _login() {
    Get.to(Createanewpassword());
  }
}
