import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Auth/signupscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/successcreen.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Accountverification2 extends StatefulWidget {
  const Accountverification2({super.key});

  @override
  State<Accountverification2> createState() => _Accountverification2State();
}

class _Accountverification2State extends State<Accountverification2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _banknamecontroller = TextEditingController();
  final TextEditingController _accountnumber = TextEditingController();
  final TextEditingController _beneficiary = TextEditingController();

  bool _isButtonEnabled = false;
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account verification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                    ),
                    Text(
                      '3 of 3',
                    ),
                  ],
                ),
                Text(
                  'Please enter your account details below',
                ),
                Divider(
                  color: colors.Appcolors,
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Text('Bank name'),
                TextFeildWithNoIcon(
                  textvalidator: (firstname) {
                    if (firstname!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _banknamecontroller,
                  Tittle: 'Enter your bank name',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Account number'),
                TextFeildWithNoIcon(
                  keyboardtype: TextInputType.number,
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else if (value.length != 10) {
                      return 'invalid account number';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _accountnumber,
                  Tittle: 'Enter your account number',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Beneficiary'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _beneficiary,
                  Tittle: 'Please enter your account holder name',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text(
                  'please the above account details must tally with your salary account',
                  style: TextStyle(color: Colors.green),
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Finished',
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

  void _login() {}
}
