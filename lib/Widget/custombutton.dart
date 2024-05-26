import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softloanapp/Constant/colors.dart';

class CustomButtonWisget extends StatefulWidget {
  final bool isActive;
  final String tittle;
  final Function()? ontap;

  ///[isActive] is use to change the button to active and inactive state
  ///[tittle] is the title of the textfild
  ///[ontap] is used to add functionality to the button when it is being taped
  const CustomButtonWisget(
      {super.key, required this.isActive, required this.tittle, this.ontap});

  @override
  State<CustomButtonWisget> createState() => _CustomButtonWisgetState();
}

class _CustomButtonWisgetState extends State<CustomButtonWisget> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    return Container(
      child: widget.isActive
          ? GestureDetector(
              onTap: widget.ontap,
              child: Container(
                height: 0.07.sh,
                alignment: Alignment.center,
                width: w.toDouble(),
                child: Text(
                  widget.tittle,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.02.sh),
                    color: colors.CustomButtonColor),
              ),
            )
          : Container(
              height: 0.07.sh,
              alignment: Alignment.center,
              width: w.toDouble(),
              child: Text(
                widget.tittle,
                style: TextStyle(color: Colors.grey),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(0.02.sh),
                  color: Colors.white),
            ),
    );
  }
}
