import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softloanapp/Screen/Resetpassword/otpscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _isButtonEnabled = false;
  bool _isCheckboxEnabled = false;
  FocusNode _focusNode = FocusNode();
  FocusNode _cpfocusNode = FocusNode();
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
                  'Recover your password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                ),
                SizedBox(
                  height: 0.05,
                ),
                Text(
                  'Please enter your phone number in the field below',
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
                      return 'Invalid phonenumber';
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
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Send',
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
    Get.to(Otpscreen());
  }
}
