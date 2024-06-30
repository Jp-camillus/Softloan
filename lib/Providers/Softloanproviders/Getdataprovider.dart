import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softloanapp/Constant_API_data/apiendpoints.dart';
import 'package:softloanapp/Constant_API_data/apihelper.dart';
import 'package:softloanapp/Constant_API_data/datakeys.dart';
import 'package:softloanapp/Feedback/Userfeedback.dart';
import 'package:softloanapp/Loadingindicator/loading.dart';
import 'package:softloanapp/Models/softloanmodel.dart';

class GetSoftloanData extends GetxController {
  bool _isloading = false;
  Softloanauth() {
    print('Authentication Initiated');
  }

  UserData? userDataa;
  void progresiveindicator() {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (buider) {
        return Loadingindicator();
      },
    );
  }

  final userdatarefresh = UserData().obs;

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

  Future<void> getorganisation() async {
    // isLoadingToggler(true);
    try {
      final response = await SoftloanHelperAPIMethods.getData(
          uri: SoftloanendPoints.ORGANISATIONDATA);
      print(response.body);
      if (response.statusCode == 200) {
        print('DATA FETCHING SUCCESSFULL');
        final Map<String, dynamic> json = jsonDecode(response.body);
        final returneddata = UserData.fromJson(json);
        print('DATA RESULTS==$returneddata');
      } else {
        print('FAIL TO FETCH ORGANISATION DATA');
        final Map<String, dynamic> json = jsonDecode(response.body);
        final returneddata = UserData.fromJson(json);
        print(returneddata);
      }
    } catch (e) {
      throw (e);
    } finally {
      // isLoadingToggler(false);
    }
  }

  Future<void> getUserData() async {
    print('GETTING USER DATA');
    try {
      final myresponse =
          await SoftloanHelperAPIMethods.GetDataWithAuthorization(
              uri: SoftloanendPoints.USERDATA);
      print(myresponse.statusCode);
      print('USER DATA:::${myresponse.body}');
      if (myresponse.statusCode == 200) {
        print("USER DATA FETCHING SUCCESSFULLY");
        Map<String, dynamic> json = jsonDecode(myresponse.body);
        UserData userData = UserData.fromJson(json['user']);
        userdatarefresh.refresh();
        print('DATA RESULTS==${userData.name}');
        userDataa = userData;
        print(userDataa!.name);
      }
    } catch (e) {
    } finally {}
  }
}
