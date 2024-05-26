import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Auth/signupscreen.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Signinscreenscreen extends StatefulWidget {
  const Signinscreenscreen({super.key});

  @override
  State<Signinscreenscreen> createState() => _SigninscreenscreenState();
}

class _SigninscreenscreenState extends State<Signinscreenscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonEnabled = false;
  FocusNode _focusNode = FocusNode();

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
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                ),
                SizedBox(
                  height: 0.05,
                ),
                Text(
                  'Please enter your details to log into your account',
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
                Text('Phone number'),
                TextFeildWithNoIcon(
                  keyboardtype: TextInputType.number,
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else if (value.length != 11) {
                      return 'invalid phone number';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: phonenumbercontroller,
                  Tittle: 'Phone Number',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Password'),
                TextFeildWithIcon(
                  validator: (pvalue) {
                    if (pvalue!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  focusnode: _focusNode,
                  textEditingController: _passwordController,
                  tittle: 'Password',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Dont have account?'),
                    GestureDetector(
                      onTap: () {
                        Get.to(Signupscreenscreen());
                      },
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Login',
                  isActive: _isButtonEnabled,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(Resetpasswordscreen());
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(color: colors.Appcolors),
                        ))
                  ],
                )
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
    Get.offAll(BottomNav());
  }
}
