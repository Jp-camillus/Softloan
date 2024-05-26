import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Createanewpassword extends StatefulWidget {
  const Createanewpassword({super.key});

  @override
  State<Createanewpassword> createState() => _CreateanewpasswordState();
}

class _CreateanewpasswordState extends State<Createanewpassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _isButtonEnabled = false;

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
                  'Create a new password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                ),
                SizedBox(
                  height: 0.05,
                ),
                Text(
                  'Please enter your password in the field below',
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
                Text('Password'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _passwordController,
                  Tittle: 'Password',
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Text('Confirm Password'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else if (value != _passwordController.text) {
                      return "password don't match";
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _confirmpasswordController,
                  Tittle: 'Confirm password',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Create',
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
    Get.to(Signinscreenscreen());
  }
}
