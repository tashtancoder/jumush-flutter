
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jumush/ui/components/dialogs.dart';
import 'package:jumush/controllers/user_controller.dart';
import 'package:jumush/models/user_model.dart';
import 'package:jumush/repos/api_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constants/styles/page_ids.dart';
import '/constants/styles/app_colors.dart';
import '/ui/pages/terms_conditions_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/generated/l10n.dart';
import 'package:get/get.dart';

class RegisterProfileScreen extends StatefulWidget {
  final String phoneNumber;
  const RegisterProfileScreen({super.key, required this.phoneNumber});


  @override
  _RegisterProfileScreenState createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State<RegisterProfileScreen> {
  get prefixIcon => null;
  String gender = '';
  String userType = '';
  //DateTime date = DateTime(2022, 12, 24);
  //final List<String> labels = ['Рабочий', 'Работодатель'];
  List<String> labels = [];
  int userTypeIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final userController = UserController.instance;
  final apiProvider = ApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    labels = [S.of(context).employee, S.of(context).employer];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        reverse: true,
        child: _buildBody(context),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton.icon(
              onPressed: () {
                registerUser();
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsConditionsScreen())); */
              },
              label: Text(
                S.of(context).continue_,
                style: TextStyle(fontFamily: 'medium'),
              ),
              icon: const Icon(Icons.arrow_right_alt_outlined),
              style: button.simpleButton(),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          S.of(context).profile_setup,
          style: style.headText(),
        ));
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/women.jpg'),
                      radius: 50,
                    ),
                    Positioned(
                      bottom: -5,
                      right: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: appColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).name,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: appColorLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: surnameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).surname,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: appColorLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                /*Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              helpText: S.of(context).birthdate,
                            );
                            if (newDate == null) return;
                            setState(() => date = newDate);
                          },
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: appColorLight,
                          ),
                          label: Text(
                            '${date.day}/${date.month}/${date.year}',
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade50,
                              onPrimary: appColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: const EdgeInsets.all(25.0),
                              textStyle: TextStyle(
                                color: appColorLight,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),*/
                Container(
                  child: Row(
                    children: <Widget>[
                      Radio(
                          value: "male",
                          activeColor: appColorLight,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      Text(S.of(context).male),
                      Radio(
                          value: "female",
                          activeColor: appColorLight,
                          groupValue: gender,
                          onChanged: (value) {

                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      Text(S.of(context).female),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: ToggleSwitch(
                    minWidth: 200,
                    cornerRadius: 15,
                    totalSwitches: 2,
                    initialLabelIndex: userTypeIndex,
                    labels: labels,
                    activeBgColor: [appColorLight],
                    onToggle: (index) {
                      userTypeIndex = index ?? 0;
                      print('switched to: $index');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> registerUser() async {

    final body = jsonEncode({
      'name': nameController.text,
      'surname': surnameController.text,
      'pol': gender,
      'phone': widget.phoneNumber,
      'type': userTypeIndex + 1
    });
    print(body);
    CustomDialogs.showProgressIndicator(context);
    final resStr = await apiProvider.registerUser(body);
    Navigator.of(context).pop();
    if (resStr.length > 20) {
      CustomDialogs.toast(context, S.of(context).successfully_registered_msg, true);
      await Future.delayed(Duration(seconds: 2));
      final resMap = jsonDecode(resStr);
      final resBody = jsonEncode({
        'id': resMap['id'],
        'online': resMap['online'] ?? false,
        'name': nameController.text,
        'surname': surnameController.text,
        'pol': gender,
        'phone': widget.phoneNumber,
        'type': userTypeIndex + 1
      });


      userController.user.value = User.fromMap(jsonDecode(resBody));
      await userController.saveUserToSP();
      Navigator.of(context).pushNamedAndRemoveUntil(
          PageIds.mainTabView, (route) => false);

    } else {
      CustomDialogs.toast(context, S.of(context).something_wrong, false);
    }


  }
}
