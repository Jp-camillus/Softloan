import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Auth/signupotp.dart';
import 'package:softloanapp/Screen/Resetpassword/otpscreen.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Signupscreenscreen extends StatefulWidget {
  const Signupscreenscreen({super.key});

  @override
  State<Signupscreenscreen> createState() => _SignupscreenscreenState();
}

class _SignupscreenscreenState extends State<Signupscreenscreen> {
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
  Color bordercolors = Colors.black;

  final List<String> items = [
    'Chitis',
    'shoprite',
    'shanahan',
    'Travels',
    'Personal need'
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
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
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                ),
                SizedBox(
                  height: 0.05,
                ),
                Text(
                  'Please enter your details to create an account',
                ),
                SizedBox(
                  height: 0.035.sh,
                ),
                Text('First Name'),
                TextFeildWithNoIcon(
                  textvalidator: (firstname) {
                    if (firstname!.isEmpty) {
                      return 'field is required';
                    } else {
                      return null;
                    }
                  },
                  textEditingController: _usernameController,
                  Tittle: 'First Name',
                ),
                SizedBox(
                  height: 0.03.sh,
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
                Text('Confirm Password'),
                TextFeildWithIcon(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field is required';
                    } else if (value != _passwordController.text) {
                      return "Password don't match";
                    } else {
                      return null;
                    }
                  },
                  focusnode: _cpfocusNode,
                  textEditingController: _confirmpasswordController,
                  tittle: 'Password',
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Text('Organisation/company'),
                FormField<String>(validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a reason';
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
                        'Choose your company...',
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
                      dropdownSearchData: DropdownSearchData(
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 60,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.Appcolors),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.01.sh),
                                ),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return item.value.toString().contains(searchValue);
                        },
                      ),
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                    ),
                  );
                }),
                SizedBox(
                  height: 0.03.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Already have account?'),
                    GestureDetector(
                      onTap: () {
                        Get.to(Signinscreenscreen());
                      },
                      child: Center(
                        child: Text(
                          'login',
                          style: TextStyle(color: colors.Appcolors),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox.adaptive(
                        value: _isCheckboxEnabled,
                        onChanged: (value) {
                          setState(() {
                            _isCheckboxEnabled = !_isCheckboxEnabled;
                            _updateButtonState();
                          });
                        }),
                    Row(
                      children: [
                        Text('Agree to our'),
                        TextButton(
                            onPressed: () {},
                            child: Text('Terms and condition'))
                      ],
                    )
                  ],
                ),
                CustomButtonWisget(
                  ontap: _isButtonEnabled ? _login : null,
                  tittle: 'Register',
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
      _isButtonEnabled =
          _formKey.currentState!.validate() && _isCheckboxEnabled;
    });
  }

  void _login() {
    Get.to(Signupotpscreen());
  }
}
