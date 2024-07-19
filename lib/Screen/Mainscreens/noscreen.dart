import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Loadingindicator/loading.dart';

class Noscreen extends StatelessWidget {
  const Noscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.flash,
              size: 0.05.sh,
              color: Colors.white,
            ),
            Text(
              'SOFT LOAN',
              style: GoogleFonts.daiBannaSil(
                  fontWeight: FontWeight.bold,
                  fontSize: 0.03.sh,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
