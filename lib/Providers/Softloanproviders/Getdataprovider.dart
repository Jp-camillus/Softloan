import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softloanapp/Constant_API_data/apiendpoints.dart';
import 'package:softloanapp/Constant_API_data/apihelper.dart';
import 'package:softloanapp/Constant_API_data/datakeys.dart';
import 'package:softloanapp/Feedback/Userfeedback.dart';
import 'package:softloanapp/Loadingindicator/loading.dart';
import 'package:softloanapp/Models/softloanmodel.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';

class GetSoftloanData extends GetxController {
  bool _isloading = false;
  Softloanauth() {
    print('Authentication Initiated');
  }

  void onReady() {
    super.onReady();
    getorganisation();
    getfaq();
  }

  UserData? userDataa;
  Datafaq? faqddata;

  void progresiveindicator() {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (buider) {
        return Loadingindicator();
      },
    );
  }

  List? allorganization;
  List? question;

  final userdatarefresh = UserData().obs;

  void isLoadingToggler(bool value) {
    _isloading = value;
    if (value) {
      progresiveindicator();
    } else {
      Get.back(); // Close the loading indicator dialog
    }
  }

  void gotologin() {
    Get.offAll(Signinscreenscreen());
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
      final response =
          await SoftloanHelperAPIMethods.GetDataWithOutAuthorization(
              uri: SoftloanendPoints.ORGANISATIONDATA);
      print(response.body);
      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        allorganization = body['data'];
      } else {
        print('FAIL TO FETCH ORGANISATION DATA');
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
      } else if (myresponse.body.contains('Unauthenticated')) {
        Future.delayed(Duration(seconds: 3), () {
          gotologin();
        });
      }
    } catch (e) {
    } finally {}
  }

  Future<List<Datafaq>> getfaq() async {
    final response = await SoftloanHelperAPIMethods.GetDataWithOutAuthorization(
        uri: SoftloanendPoints.FAQ);
    print(response.body);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
    } else {
      print('FAIL TO FETCH ORGANISATION DATA');
    }
    final data = json['data'] as List<dynamic>;
    print('this is my data $data');
    final faqdata = data.map((element) {
      return Datafaq(
          id: element['id'],
          question: element['question'],
          answer: element['answer']);
    }).toList();
    print('this is my faq dataaaaa$faqdata');
    return faqdata;
  }
}
