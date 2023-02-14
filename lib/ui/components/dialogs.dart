import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constants/styles/app_colors.dart';
import '/generated/l10n.dart';

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

  static Future <int> showChangeType( BuildContext context, int initType) async{
    int type = initType - 1;
    final labels = [S.of(context).employee, S.of(context).employer];
    final int finalType = await showDialog(context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).change_type),
            content: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 100,
              child: Center(
                child: ToggleSwitch(
                  minWidth: 130,
                  cornerRadius: 15,
                  totalSwitches: 2,
                  initialLabelIndex: type,
                  labels: labels,
                  activeBgColor: [appColorLight],
                  onToggle: (index) {
                    type = index ?? 0;
                    print('switched to: $index');
                  },
                ),
              ),
            ),
            //contentPadding: EdgeInsets.all(5),
            insetPadding: EdgeInsets.zero,
            actions:<Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: (){
                        Navigator.pop(context, type + 1);
                      },
                      child: Text(S.of(context).save)
                  ),
                  OutlinedButton(
                      onPressed: (){
                        Navigator.pop(context, 0);
                      },
                      child: Text(S.of(context).cancel)),
                ],
              ),


            ]
          );

        }
    );

    return finalType;

  }

  static Future <int> showEmpState( BuildContext context, bool online) async{
    int stateOnline = online ? 0 : 1;
    final labels = [S.of(context).online, S.of(context).offline];
    final int finalType = await showDialog(context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              title: Text(S.of(context).change_type),
              content: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 100,
                child: Center(
                  child: ToggleSwitch(
                    minWidth: 120,
                    cornerRadius: 15,
                    totalSwitches: 2,
                    initialLabelIndex: stateOnline,
                    labels: labels,
                    activeBgColor: [jumushColorGreenLight],
                    icons: [Icons.online_prediction, Icons.offline_bolt_outlined],
                    onToggle: (index) {
                      stateOnline = index ?? 0;
                      print('switched to: $index');
                    },
                  ),
                ),
              ),
              //contentPadding: EdgeInsets.all(5),
              insetPadding: EdgeInsets.zero,
              actions:<Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context, stateOnline);
                        },
                        child: Text(S.of(context).save)
                    ),
                    OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context, -1);
                        },
                        child: Text(S.of(context).cancel)),
                  ],
                ),


              ]
          );

        }
    );

    return finalType;

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