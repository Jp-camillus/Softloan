import 'package:flutter/material.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Auth/signupotp.dart';

class AppRoute {
  static const loginroute = '/login_screen';
  static const Verifyphone = '/verify_phone';

  static Map<String, WidgetBuilder> routes = {
    loginroute: (context) => Signinscreenscreen(),
    Verifyphone: (context) => Signupotpscreen()
  };
}
