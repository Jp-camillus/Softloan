import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Loadingindicator/loading.dart';
import 'package:softloanapp/Models/softloanmodel.dart';
import 'package:softloanapp/Providers/Softloanproviders/Getdataprovider.dart';

class FAQscreen extends StatefulWidget {
  const FAQscreen({super.key});

  @override
  State<FAQscreen> createState() => _FAQscreenState();
}

class _FAQscreenState extends State<FAQscreen> {
  GetSoftloanData getSoftloanData = GetSoftloanData();
  List<Datafaq> userdata = [];
  void initState() {
    super.initState();
    fetchUser();
  }

  bool istapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Frequent asked questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: userdata.length,
            itemBuilder: (context, index) {
              final user = userdata[index];

              return Text(user.answer);
            }),
      ),
    );
  }

  Future<void> fetchUser() async {
    final myreponse = await getSoftloanData.getfaq();
    setState(() {
      userdata = myreponse;
    });
  }
}
