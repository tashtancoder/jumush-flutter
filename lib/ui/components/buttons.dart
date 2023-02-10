import 'package:flutter/material.dart';
import '/constants/styles/app_colors.dart';
simpleButton() {
  return ElevatedButton.styleFrom(
    primary: appColor,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
}

BorderedButton() {
  return ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: appColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          side: BorderSide(color: appColor, width: 1)),
      elevation: 0);
}