import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:softloanapp/Bindings/appbindings.dart';
import 'package:softloanapp/Intro/authintroscreen.dart';
import 'package:softloanapp/Organisation/Ogdashboard.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification2.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification3.dart';

import 'package:softloanapp/Screen/Mainscreens/navdashboardscreen.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';

void main() {
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // for top
        // systemNavigationBarColor: Colors.green, // for bottom
      ),
      child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'soft loan',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                useMaterial3: true,
              ),
              home: Introscreen(),
            );
          }),
    );
  }
}
