import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  var user = User.emptyConstructor().obs;

  @override
  void onInit() async {
    print('onInit method');
    super.onInit();
    await getFromSP();

  }

  saveUserToSP() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userStr = jsonEncode(user.value.toMap());
    sp.setString('user', userStr);
  }

  getFromSP() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    dynamic userData = jsonDecode(sp.getString('user') ?? '');
    user.value = User.fromMap(userData);
  }

  registerUser() async {

  }



}