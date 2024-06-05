import 'package:flutter/material.dart';
import 'package:softloanapp/Constant/colors.dart';

class Userfeedback {
  Showpositivesnakebar(String message) {
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> build(
        BuildContext context) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$message'),
        backgroundColor: colors.Appcolors,
      ));
    }
  }

  Shownegetivesnackbar(String message) {
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> build(
        BuildContext context) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$message'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
