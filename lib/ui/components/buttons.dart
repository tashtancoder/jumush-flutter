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