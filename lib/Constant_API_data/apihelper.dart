import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softloanapp/Constant_API_data/apiendpoints.dart';
import 'package:softloanapp/Constant_API_data/datakeys.dart';

class SoftloanHelperAPIMethods {
  static SoftloanHeaders() {
    return <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
  }

  static Future<Response> getData({required String uri}) async {
    final url = Uri.parse(uri);
    try {
      Response response = await http.get(url); //
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING GET REQUEST: $e");
      return Response({"GET REQUEST FAILED"}.toString(), 1);
    }
  }

  static Future<Response> postData({
    required String uri,
    required dynamic body,
  }) async {
    // url
    final url = Uri.parse(uri);
    // String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    try {
      Response response = await http.post(
        url,
        body: body,
        headers: SoftloanHeaders(),
      );

      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING POST REQUEST: $e");
      return Response({"POST REQUEST FAILED"}.toString(), 1);
    }
  }

  static Future<Response> patchData({
    required String uri,
    required dynamic body,
  }) async {
    // url
    final url = Uri.parse(uri);

    try {
      Response response =
          await http.patch(url, body: body, headers: SoftloanHeaders());
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING PATCH REQUEST: $e");
      return Response({"PATCH REQUEST FAILED"}.toString(), 1);
    }
  }
}
