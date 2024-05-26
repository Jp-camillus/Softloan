import 'package:flutter/material.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNav(),
    );
  }
}
