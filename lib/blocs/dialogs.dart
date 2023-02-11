import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialogs {
  static showProgressIndicator( BuildContext context){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
    );

  }

  static toast(BuildContext context, String msg, bool isPositive){
    Fluttertoast.showToast(
      msg: msg,
      textColor: isPositive ? Colors.white : Colors.yellowAccent,
      //gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}