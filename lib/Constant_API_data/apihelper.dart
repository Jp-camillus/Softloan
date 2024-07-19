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
      "Accept": "application/json",
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    };
  }

  static SoftloanheaderwithAuthorization(String token) {
    return <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
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

  static Future<Response> PostDataWithAuthorization({
    required String uri,
    required dynamic body,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    debugPrint("SOFTLOANTOKEN :::$token");
    final url = Uri.parse(uri);
    try {
      Response response = await http.post(
        url,
        body: body,
        headers: SoftloanheaderwithAuthorization(token!),
      );
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING POST REQUEST: $e");
      return Response({"POST REQUEST FAILED"}.toString(), 1);
    }
  }

  static Future<Response> GetDataWithAuthorization({
    required String uri,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    debugPrint("SOFTLOANTOKEN :::$token");
    final url = Uri.parse(uri);
    try {
      Response response = await http.get(
        url,
        headers: SoftloanheaderwithAuthorization(token!),
      );
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING GET REQUEST: $e");
      return Response({"GET REQUEST FAILED"}.toString(), 1);
    }
  }

  static Future<Response> GetDataWithOutAuthorization({
    required String uri,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    debugPrint("SOFTLOANTOKEN :::$token");
    final url = Uri.parse(uri);
    try {
      Response response = await http.get(
        url,
        headers: SoftloanHeaders(),
      );
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

  static Future<Response> putdata({
    required String uri,
    required dynamic body,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    final url = Uri.parse(uri);

    try {
      Response response = await http.put(url,
          body: body, headers: SoftloanheaderwithAuthorization(token!));
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING PATCH REQUEST: $e");
      return Response({"PATCH REQUEST FAILED"}.toString(), 1);
    }
  }

  static Future<Response> putformdata({
    required String uri,
    required dynamic body,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    final url = Uri.parse(uri);

    try {
      Response response = await http.put(url,
          body: body, headers: SoftloanheaderwithAuthorization(token!));
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING PATCH REQUEST: $e");
      return Response({"PATCH REQUEST FAILED"}.toString(), 1);
    }
  }
}
