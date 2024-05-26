import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softloanapp/Constant/colors.dart';

class TextFeildWithNoIcon extends StatefulWidget {
  const TextFeildWithNoIcon(
      {super.key,
      required this.Tittle,
      this.textEditingController,
      this.textvalidator,
      this.keyboardtype});
  final String Tittle;
  final TextEditingController? textEditingController;
  final String? Function(String?)? textvalidator;
  final TextInputType? keyboardtype;

  ///the [Tittle] is if you want to add a text to your text field
  /// the [textEditingController] is use to control the textcontent of the textfield

  @override
  State<TextFeildWithNoIcon> createState() => _TextFeildWithNoIconState();
}

class _TextFeildWithNoIconState extends State<TextFeildWithNoIcon> {
  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        validator: widget.textvalidator,
        controller: widget.textEditingController,
        focusNode: focusNode,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.Appcolors),
            borderRadius: BorderRadius.all(
              Radius.circular(0.01.sh),
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.008.sh, horizontal: 0.04.sw),
          hintText: widget.Tittle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.01.sh),
            ),
          ),
        ),
      ),
    );
  }
}

/// this [TextFeildWithIcon] is for textfield that has prefix icon and sufix icon
class TextFeildWithIcon extends StatefulWidget {
  final String? Function(String?)? validator;
  final GlobalKey? key;
  final FocusNode? focusnode;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardtype;

  final String tittle;
  TextFeildWithIcon(
      {required this.tittle,
      this.validator,
      this.focusnode,
      this.textEditingController,
      this.key,
      this.keyboardtype});
  @override
  _TextFeildWithIconState createState() => _TextFeildWithIconState();
}

class _TextFeildWithIconState extends State<TextFeildWithIcon> {
  FocusNode focusNode = FocusNode();
  bool PvisibilityController = false;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      validator: widget.validator,
      controller: widget.textEditingController,
      focusNode: widget.focusnode,
      obscureText: PvisibilityController,
      keyboardType: widget.keyboardtype,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0.01.sh),
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: widget.focusnode!.hasFocus ? colors.Appcolors : Colors.grey,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.01.sh),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.01.sh),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                PvisibilityController = !PvisibilityController;
              });
            },
            child: PvisibilityController
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility)),
        hintText: widget.tittle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.01.sh),
          ),
          borderSide: BorderSide(
            color: focusNode.hasFocus ? colors.Appcolors : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.01.sh),
          ),
          borderSide: BorderSide(
            color: colors.Appcolors,
          ),
        ),
      ),
    );
  }
}
