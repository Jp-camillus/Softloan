import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softloanapp/Constant_API_data/apiendpoints.dart';
import 'package:softloanapp/Constant_API_data/datakeys.dart';

class SoftloanHelperAPIMethods {
  static SoftloanHeaders() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

  static SoftloanHeadersWithContent(String token) {
    return <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
  }

  // A function performing GET request to a server. It has no headers, it is just getting the products
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

  // This is a function specifically for getting info/details from the API.
  //It has headers which is needed for authorization of each specific user
  static Future<Response> getDataWithHeader({required String uri}) async {
    final url = Uri.parse(uri);

    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);
    debugPrint("TOKEN :::$token");

    try {
      Response response =
          await http.get(url, headers: SoftloanHeadersWithContent(token!));
      return response;
    } catch (e) {
      debugPrint("ERROR AT MAKING GET REQUEST: $e");
      return Response({"GET REQUEST FAILED"}.toString(), 1);
    }
  }

  // A function performing POST request to a server
  static Future<Response> postData({
    required String uri,
    required dynamic body,
    required bool withHeader,
  }) async {
    // url
    final url = Uri.parse(uri);

    // get token
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);

    try {
      if (withHeader) {
        Response response = await http.post(url,
            body: body, headers: SoftloanHeadersWithContent(token!));
        return response;
      } else {
        Response response = await http.post(
          url,
          body: body,
          headers: SoftloanHeaders(),
        );
        return response;
      }
    } catch (e) {
      debugPrint("ERROR AT MAKING POST REQUEST: $e");
      return Response({"POST REQUEST FAILED"}.toString(), 1);
    }
  }

  // A function performing POST request to a server with the content type in header
  static Future<Response> postDataWithContent({
    required String uri,
    required dynamic body,
    required bool withHeader,
  }) async {
    // url
    final url = Uri.parse(uri);

    // get token
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);

    try {
      if (withHeader) {
        Response response = await http.post(url,
            headers: SoftloanHeadersWithContent(token!), body: body);
        return response;
      } else {
        Response response = await http.post(url, body: body);
        return response;
      }
    } catch (e) {
      debugPrint("ERROR AT MAKING POST REQUEST: $e");
      return Response({"POST REQUEST FAILED"}.toString(), 1);
    }
  }
  // static Future<Response> postDataWithContext({
  //   required String uri,
  //   required dynamic body,
  //   required bool withHeader,
  // }) async {
  //   // url
  //   final url = Uri.parse(uri);

  //   // get token
  //   final sharedPref = await SharedPreferences.getInstance();
  //   String? token = await sharedPref.getString(SoftloanDataKeys.TOKEN);

  //   try {
  //     Map<String, String> headers = {
  //       if (withHeader) 'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //     };

  //     Response response = await http.post(url, headers: headers, body: body);
  //     return response;
  //   } catch (e) {
  //     debugPrint("ERROR AT MAKING POST REQUEST: $e");
  //     return Response({"POST REQUEST FAILED"}.toString(), 1);
  //   }
  // }

  // A function performing PATCH request to a server
  static Future<Response> patchData(
      {required String uri,
      required dynamic body,
      required bool withHeader}) async {
    // url
    final url = Uri.parse(uri);

    // get token
    final sharedPref = await SharedPreferences.getInstance();
    String? token = await sharedPref.getString(SoftlaonDataKeys.TOKEN);

    try {
      if (withHeader) {
        Response response = await http.patch(url,
            headers: SoftloanHeadersWithContent(token!), body: body);
        return response;
      } else {
        Response response =
            await http.patch(url, body: body, headers: SoftloanHeaders());
        return response;
      }
    } catch (e) {
      debugPrint("ERROR AT MAKING PATCH REQUEST: $e");
      return Response({"PATCH REQUEST FAILED"}.toString(), 1);
    }
  }
}
