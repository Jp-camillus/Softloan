import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Providers/Authproviders/registerclass.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification3.dart';
import 'package:softloanapp/Screen/Mainscreens/successcreen.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Accountverificationscreen extends StatefulWidget {
  const Accountverificationscreen({super.key});

  @override
  State<Accountverificationscreen> createState() =>
      _AccountverificationscreenState();
}

class _AccountverificationscreenState extends State<Accountverificationscreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
  Color bordercolors = Colors.black;

  final List<String> items = [
    'male',
    'female',
  ];
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _workrolecontroller = TextEditingController();
  final TextEditingController _worktypecontroller = TextEditingController();
  final TextEditingController _salary = TextEditingController();
  final TextEditingController _email = TextEditingController();

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
                Text('Email'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _email,
                  Tittle: 'Email',
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
                Text('Work type'),
                TextFeildWithNoIcon(
                  textvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _worktypecontroller,
                  Tittle: 'Work type',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Gender'),
                FormField<String>(validator: (value) {
                  if (value == null || selectedValue == null) {
                    return 'Please choose your gender';
                  }
                  return null;
                }, builder: (FormFieldState<String> state) {
                  return Container(
                    height: 0.063.sh,
                    decoration: BoxDecoration(
                      border: Border.all(color: bordercolors),
                      borderRadius: BorderRadius.circular(0.01.sh),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    width: 1.sw,
                    child: DropdownButton2<String>(
                      underline: Container(),
                      hint: Text(
                        'gender',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          bordercolors = colors.Appcolors;
                          selectedValue = value;
                          state.didChange(value);
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        decoration: BoxDecoration(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 60,
                        width: 350,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),

                      //This to clear the search value when you close the menu
                    ),
                  );
                }),
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

  Registeruserdata? registeruserdata;
  void _login() {
    Get.to(Accountverificationimagepicker(
      email: _email.text,
      gender: selectedValue.toString(),
      worktype: _worktypecontroller.text.trim(),
      lastnamecontroller: _lastnamecontroller.text.trim(),
      salary: _salary.text.trim(),
      surnamecontroller: _surnamecontroller.text.trim(),
      workrolecontroller: _workrolecontroller.text.trim(),
    ));
  }
}
