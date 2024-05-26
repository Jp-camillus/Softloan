import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Screen/Auth/signinscreen.dart';
import 'package:softloanapp/Screen/Auth/signupscreen.dart';
import 'package:softloanapp/Widget/custombutton.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height.round();
    var w = MediaQuery.of(context).size.width.round();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.flash,
                  size: 0.05.sh,
                  color: colors.Appcolors,
                ),
                Text(
                  'SOFT LOAN',
                  style: GoogleFonts.daiBannaSil(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.03.sh,
                      color: const Color.fromARGB(255, 0, 44, 40)),
                ),
              ],
            ),
            Column(children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3.sh,
                  clipBehavior: Clip.antiAlias,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 12),
                  autoPlayAnimationDuration: Duration(milliseconds: 300),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: carouselItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  carouselItems.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? colors.Appcolors
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomButtonWisget(
                    isActive: true,
                    tittle: 'Get Started',
                    ontap: () {
                      Get.to(
                          transition: Transition.leftToRight,
                          Signupscreenscreen());
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('already have account?'),
                TextButton(
                    onPressed: () {
                      Get.to(
                          transition: Transition.leftToRight,
                          Signinscreenscreen());
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> carouselItems = [
    Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          Image(
            image: AssetImage(Appimages.globe),
          ),
          Center(
            child: Text(
              'Globe',
              style: TextStyle(fontSize: 0.02.sh, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
              'Get your loan right from your current location just with your smartphone')
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Image(
              image: AssetImage(Appimages.customersupport),
            ),
            Center(
              child: Text(
                'Customer Support',
                style:
                    TextStyle(fontSize: 0.02.sh, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
                'We are always there for you incase of any problem, chat with us or call us directly')
          ],
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Image(
              image: AssetImage(Appimages.form),
            ),
            Center(
              child: Text(
                'Application',
                style:
                    TextStyle(fontSize: 0.02.sh, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
                'Fast and few requirement, just fill some few forms and you are good to go')
          ],
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Image(
              image: AssetImage(Appimages.time),
            ),
            Center(
              child: Text(
                'Fast credit alert',
                style:
                    TextStyle(fontSize: 0.02.sh, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
                'Get your money within 5 minutes directly to your bank account with zero stress')
          ],
        ),
      ),
    ),
    // Add more Container widgets for additional carousel items
  ];
}
