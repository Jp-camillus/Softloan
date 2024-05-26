import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification3.dart';
import 'package:softloanapp/Screen/Mainscreens/successcreen.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Accountverificationscreen extends StatefulWidget {
  const Accountverificationscreen({super.key});

  @override
  State<Accountverificationscreen> createState() =>
      _AccountverificationscreenState();
}

class _AccountverificationscreenState extends State<Accountverificationscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _workrolecontroller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _salary = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();

  final TextEditingController _Beneficiary = TextEditingController();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account verification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                    ),
                    Text('1 of 3')
                  ],
                ),
                SizedBox(
                  height: 0.03,
                ),
                Text(
                  'Please enter your details to verify your account',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Personal details'),
                Divider(
                  color: colors.Appcolors,
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                Text('Surname'),
                TextFeildWithNoIcon(
                  textvalidator: (firstname) {
                    if (firstname!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _surnamecontroller,
                  Tittle: 'Surname',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('last name'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _lastnamecontroller,
                  Tittle: 'last name',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Work role'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _workrolecontroller,
                  Tittle: 'Work role',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Gender'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (!_gendercontroller.text.contains('male') &&
                        !_gendercontroller.text.contains('female')) {
                      return 'You must be a male or a female';
                    } else if (value!.isEmpty) {
                      return 'this field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _gendercontroller,
                  Tittle: 'Gender',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Salary'),
                TextFeildWithNoIcon(
                  keyboardtype: TextInputType.number,
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _salary,
                  Tittle: 'Salary',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Next',
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
    Get.to(Accountverificationimagepicker());
  }
}
