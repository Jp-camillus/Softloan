import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/listdata.dart';

class Historyscreen extends StatefulWidget {
  const Historyscreen({super.key});

  @override
  State<Historyscreen> createState() => _HistoryState();
}

class _HistoryState extends State<Historyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              historyData.length,
              (index) => Column(
                children: [
                  ListTile(
                    leading: Container(
                        height: 0.07.sh,
                        width: 0.1.sw,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: historyData[index]['Color']),
                        child: Icon(
                          historyData[index]['icon'],
                          color: Colors.white,
                        )),
                    title: Text(historyData[index]['tittle']),
                    subtitle: Text('17 May, 2024'),
                    trailing: Column(
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(fontSize: 0.018.sh),
                        ),
                        Text(
                          historyData[index]['Amount'],
                          style: TextStyle(
                              fontSize: 0.018.sh,
                              color: historyData[index]['Color']),
                        ),
                      ],
                    ),
                  ),
                  Divider()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
