import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softloanapp/Constant_API_data/apiendpoints.dart';
import 'package:softloanapp/Constant_API_data/apihelper.dart';
import 'package:softloanapp/Constant_API_data/datakeys.dart';
import 'package:softloanapp/Feedback/Userfeedback.dart';
import 'package:http/http.dart' as http;
import 'package:softloanapp/Loadingindicator/loading.dart';
import 'package:softloanapp/Route/approute.dart';
import 'package:softloanapp/Screen/Auth/signupotp.dart';
import 'package:softloanapp/Screen/Mainscreens/successcreen.dart';
import 'package:softloanapp/Succes&faliurescreen/loanapplysuccess.dart';

import '../../Widget/bottomnavbar.dart';

class Softloanauth extends GetxController {
  bool _isloading = false;
  Softloanauth() {
    print('Authentication Initiated');
  }
  void progresiveindicator() {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (buider) {
        return Loadingindicator();
      },
    );
  }

  // isLogin change

  void isLoadingToggler(bool value) {
    _isloading = value;
    if (value) {
      progresiveindicator();
    } else {
      Get.back(); // Close the loading indicator dialog
    }
  }

  UserfeedBack _userfeedBack = UserfeedBack();
  // is user loggedIn
  Future<bool> isUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);

    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // go home
  void goToHome() {}

  void goToPhoneverify() {
    Get.off(Signupotpscreen());
  }

  void goTodashboard() {
    Get.offAll(BottomNav());
  }

  void goToverificationsuccess() {
    Get.offAll(Successcreen());
  }

  void goToLoansuccessfull() {
    Get.offAll(Loansuccessscreen());
  }

  Future<void> RegisterNewUser(
      {required String name,
      required String phone,
      required String passwordconfirm,
      required String organisation,
      required String password}) async {
    isLoadingToggler(true);

    final sp = await SharedPreferences.getInstance();
    try {
      http.Response myresponse = await SoftloanHelperAPIMethods.postData(
        uri: SoftloanendPoints.REGISTERENDPOINT,
        body: jsonEncode(
          {
            'name': name,
            'phone': phone,
            'organization': organisation,
            'password': password,
            'password_confirmation': passwordconfirm,
          },
        ),
      ).timeout(Duration(seconds: 120));

      print(myresponse.body);
      print("STATUS: ${myresponse.statusCode}");
      var decodeddata = jsonDecode(myresponse.body);

      print("REGISTERERED-CLIENT: $decodeddata");
      if (myresponse.statusCode == 201) {
        print('Registration succesful');
        _userfeedBack.showfeedback(Colors.green, 'Registration Successfull');
        goToPhoneverify();
        await sp.setString(SoftlaonDataKeys.TOKEN, decodeddata['token']);
        await sp.setString(SoftlaonDataKeys.ORGANISATION, organisation);
        await sp.setString(SoftlaonDataKeys.PHONE, phone);
        await sp.setString(SoftlaonDataKeys.PASSWORD, password);
        print(' registered phone number${SoftlaonDataKeys.PHONE}');
      } else if (myresponse.statusCode == 422) {
        _userfeedBack.showfeedback(Colors.red, 'Registration failed');
        _userfeedBack.showfeedback(Colors.red, '${decodeddata['message']}');
      } else if (myresponse.statusCode == 200) {
        _userfeedBack.showfeedback(
            Colors.red, 'check your internet connection');
        _userfeedBack.showfeedback(Colors.red, 'Registration Failed');
      } else {
        print('Registration Failed');
        _userfeedBack.showfeedback(Colors.red, 'Registration Failed');
      }
    } catch (e) {
      _userfeedBack.showfeedback(Colors.red, 'Network error');
      throw (e);
    } finally {
      isLoadingToggler(false);
    }
  }

  //for sending OTP to mobile number
  Future<void> sendOTPtoPhone({required String PhoneNumber}) async {
    isLoadingToggler(true);
    try {
      final myresponse = await SoftloanHelperAPIMethods.postData(
        uri: SoftloanendPoints.PHONE,
        body: jsonEncode({'_code': PhoneNumber}),
      );
      print("SENDOTP STATUS CODE==${myresponse.statusCode}");
      if (myresponse.statusCode == 200) {}
    } catch (e) {
      throw (e);
    }
  }

  Future<void> VerifyOTP({required String code}) async {
    isLoadingToggler(true);
    try {
      final myresponse = await SoftloanHelperAPIMethods.postData(
          uri: SoftloanendPoints.VERIFYPHONE,
          body: jsonEncode({'_code': code}));
      print(myresponse.statusCode);
      if (myresponse.statusCode == 201) {
        print('Phone verification successful');
        _userfeedBack.showfeedback(Colors.green, 'Verification succesful');
        goTodashboard();
      }
    } catch (e) {
      _userfeedBack.showfeedback(Colors.red, '$e');
    } finally {
      isLoadingToggler(false);
    }
  }

  //for signing up user

  Future<void> SignInUser(
      {required String phoneNumber, required String password}) async {
    isLoadingToggler(true);
    final sp = await SharedPreferences.getInstance();

    try {
      final myresponse = await SoftloanHelperAPIMethods.postData(
        uri: SoftloanendPoints.LOGINUSER,
        body: jsonEncode({'phone': phoneNumber, 'password': password}),
      );

      print('SIGN IN STATUS CODE: ${myresponse.statusCode}');
      final decoderesponse = jsonDecode(myresponse.body);
      print(decoderesponse);
      if (myresponse.statusCode == 201) {
        await sp.setString(SoftlaonDataKeys.TOKEN, decoderesponse['token']);
        _userfeedBack.showfeedback(Colors.green, 'Login successfull');
        goTodashboard();
      }
    } catch (e) {
      _userfeedBack.showfeedback(Colors.red, 'check your internet connection');
      throw (e);
    } finally {
      isLoadingToggler(false);
    }
  }

  Future<void> verifyuser(
      {required String email,
      required String surname,
      required String lastname,
      required String worktype,
      required String workrole,
      required String gender,
      required String salary,
      required String bank,
      required String accountnumber,
      required String accountname,
      required String image}) async {
    isLoadingToggler(true);

    try {
      final myresponse = await SoftloanHelperAPIMethods.postData(
        uri: SoftloanendPoints.VERIFICAITON,
        body: jsonEncode(
          {
            'email': email,
            'surname': surname,
            'last_name': lastname,
            'work_type': worktype,
            'work_role': workrole,
            'gendergender': gender,
            'salary': salary,
            'bank': bank,
            'account_number': accountnumber,
            'account_name': accountname,
            'image': image
          },
        ),
      );
      var body = myresponse.body;
      print('THIS IS THE DETAIL OF THE REGISTERED BODY: $body');
      var decodebody = jsonDecode(body);
      print('DECODED BODY=> $decodebody');
      if (myresponse.statusCode == 201) {
        print('VERIFICATION SUCCESSFULL');
        _userfeedBack.showfeedback(Colors.green, 'VERIFICATION SUCCESSFUL');
        goToverificationsuccess();
      } else {
        _userfeedBack.showfeedback(Colors.red, 'VERIFICATION Failed');
      }
    } catch (e) {
      _userfeedBack.showfeedback(Colors.red, 'Network error');
    } finally {
      isLoadingToggler(false);
    }
  }

  Future<void> Loanapply(
      {required String amount, required String reasonforloan}) async {
    isLoadingToggler(true);
    try {
      final myresponse = await SoftloanHelperAPIMethods.postData(
        uri: SoftloanendPoints.LOANS,
        body: jsonEncode({'amount': amount, 'reason': reasonforloan}),
      );
      var loanbody = myresponse.body;
      var loanapplystatuscode = myresponse.statusCode;
      print('LOAN APPLY STATUS CODE==$loanapplystatuscode');
      print('THE LOAN BODY=> $loanbody');
      if (myresponse.statusCode == 201) {
        print('LOAN APPLY SUCCESSFULL');
        _userfeedBack.showfeedback(Colors.green, 'Loan apply successful');
        goToLoansuccessfull();
      } else {
        print('LOAN APPLICATION FAILED');
        _userfeedBack.showfeedback(Colors.red, 'Loan application failed');
      }
    } catch (e) {
      _userfeedBack.showfeedback(Colors.red, 'Unable to access the server');
    } finally {
      isLoadingToggler(false);
    }
  }
}
