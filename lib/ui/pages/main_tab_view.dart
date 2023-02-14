/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumush/controllers/user_controller.dart';
import 'package:jumush/ui/components/dialogs.dart';
import 'package:jumush/ui/pages/message_detail_page.dart';
import 'package:jumush/ui/pages/message_page.dart';
import 'package:jumush/ui/pages/notification_page.dart';
import 'package:jumush/ui/pages/profile_page.dart';
import '../../repos/api_provider.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/constants/styles/app_colors.dart';
import '/ui/pages/home_page.dart';
import '/generated/l10n.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);


  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _currentIndex = 0;
  final UserController userController = UserController.instance;
  @override
  Widget build(BuildContext context) {
    print('Main tab build method');
    print(userController.user.value.name);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: (TabBar(
          labelColor: appColor,
          unselectedLabelColor: const Color.fromARGB(255, 185, 196, 207),
          labelPadding: const EdgeInsets.symmetric(horizontal: 0),
          labelStyle: TextStyle(
            fontFamily: 'regular',
            fontSize: 18,
          ),
          onTap: (int index) => setState(() => _currentIndex = index),
          tabs: [
            Tab(
              icon: Icon(
                Icons.home_filled,
                color: _currentIndex == 0
                    ? appColor
                    : const Color.fromARGB(255, 185, 196, 207),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.message,
                color: _currentIndex == 1
                    ? appColor
                    : const Color.fromARGB(255, 185, 196, 207),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications,
                color: _currentIndex == 2
                    ? appColor
                    : const Color.fromARGB(255, 185, 196, 207),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 3
                    ? appColor
                    : const Color.fromARGB(255, 185, 196, 207),
              ),
            ),
          ],
        )),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            MessagePage(),
            NotificationPage(),
            ProfilePage(),
          ],
        ),
        floatingActionButton: Obx(() => userController.user.value.type == 1 ? Container(
          height: 65.0,
          width: 65.0,
          margin: EdgeInsets.only(bottom: 20),
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: userController.user.value.online ? jumushColorGreenLight.withOpacity(0.3) : appColorLight.withOpacity(0.3),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: FloatingActionButton(
                backgroundColor: userController.user.value.online ? jumushColorGreenLight : appColorLight,
                onPressed: () async {
                  print('employee online taped');
                  final int  stateOnline = await CustomDialogs.showEmpState(context, userController.user.value.online);
                  print(stateOnline);
                  final bool newStateOnline = stateOnline == 0 ? true : false;
                  if (stateOnline != -1 && newStateOnline != userController.user.value.online) {
                    changeEmployeeState(newStateOnline);
                  }

                },
                child: userController.user.value.online ? const Icon(Icons.online_prediction, color: Colors.white) : const Icon(Icons.offline_bolt_outlined, color: Colors.white)
              ),
            ),
          ),
        ) : Container(
          height: 65.0,
          width: 65.0,
          margin: EdgeInsets.only(bottom: 20),
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: appColor.withOpacity(0.3),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: FloatingActionButton(
                backgroundColor: appColor,
                onPressed: () {

                },
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Future<void> changeEmployeeState(bool newOnline) async{
    final apiProvider = ApiProvider();
    final body = jsonEncode({
      'id': userController.user.value.id,
      'online': newOnline
    });
    print(body);
    CustomDialogs.showProgressIndicator(context);
    final resStr = await apiProvider.changeEmployeeState(body);
    Navigator.of(context).pop();
    if (resStr == 'changed') {
      /*userController.user.value.type = newType;
      userController.saveUserToSP();
      userController.user.refresh();*/
      userController.changeEmployeeState(newOnline);
      CustomDialogs.toast(context, S.of(context).now_u_are + ' ' + (userController.user.value.online ? S.of(context).online : S.of(context).offline), true);
    } else {
      CustomDialogs.toast(context, S.of(context).something_wrong, false);
    }


  }
}
