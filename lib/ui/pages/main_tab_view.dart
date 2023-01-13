/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'package:flutter/material.dart';
import 'package:jumush/ui/pages/message_page.dart';
import 'package:jumush/ui/pages/notification_page.dart';
import 'package:jumush/ui/pages/profile_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/constants/styles/app_colors.dart';
import '/ui/pages/home_page.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);


  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
      ),
    );
  }
}
