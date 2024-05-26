import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softloanapp/Constant/colors.dart';
import 'package:softloanapp/Constant/images.dart';
import 'package:softloanapp/Screen/Auth/signupscreen.dart';
import 'package:softloanapp/Screen/Mainscreens/Accountverification2.dart';

import 'package:softloanapp/Screen/Resetpassword/resetpasswordscreen.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';
import 'package:softloanapp/Widget/custombutton.dart';
import 'package:softloanapp/Widget/textfield.dart';

class Accountverificationimagepicker extends StatefulWidget {
  const Accountverificationimagepicker({super.key});

  @override
  State<Accountverificationimagepicker> createState() =>
      _AccountverificationimagepickerState();
}

class _AccountverificationimagepickerState
    extends State<Accountverificationimagepicker> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _banknamecontroller = TextEditingController();
  final TextEditingController _accountnumber = TextEditingController();
  final TextEditingController _beneficiary = TextEditingController();

  bool _isButtonEnabled = false;
  FocusNode _focusNode = FocusNode();
  File? _selectedimage;
  bool _isimageuploaded = false;
  String imagepath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account verification',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 0.034.sh),
                  ),
                  Text(
                    '2 of 3',
                  ),
                ],
              ),
              Text(
                'Please we will like you to upload your picture for easy verification',
              ),
              Divider(
                color: colors.Appcolors,
              ),
              Container(
                height: 0.4.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Color.fromARGB(48, 0, 150, 135),
                ),
                child: _selectedimage != null
                    ? Image.file(_selectedimage!)
                    : Image(image: AssetImage(Appimages.picturepicker)),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              _selectedimage != null
                  ? Text(imagepath)
                  : Row(
                      children: [
                        Icon(
                          Iconsax.camera_slash,
                          color: Colors.red,
                        ),
                        Text(
                          'No image path yet please upload one',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _pickImageFromGalary();
                    },
                    child: Card(
                      child: Container(
                        height: 0.07.sh,
                        width: 0.8.sw,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.01.sh),
                            color: colors.Appcolors),
                        child: Text(
                          'upload image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'please the above picture must be your own clear picture',
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              CustomButtonWisget(
                ontap: _isButtonEnabled ? _login : null,
                tittle: 'Next',
                isActive: _isButtonEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    Get.to(Accountverification2());
  }

  Future _pickImageFromGalary() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedimage == null) {
      return null;
    }
    setState(() {
      _selectedimage = File(returnedimage!.path);
      imagepath = returnedimage.path;
      _isButtonEnabled = true;
    });
  }

  Future _pickImageFromcamera() async {
    final returnedcameraImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedcameraImage == null) {
      return null;
    }
    setState(() {
      _selectedimage = File(returnedcameraImage!.path);
      imagepath = returnedcameraImage.path;
    });
  }
}
