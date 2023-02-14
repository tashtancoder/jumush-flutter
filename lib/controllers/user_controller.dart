import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  var user = User.emptyConstructor().obs;
  var loading = true.obs;
  late SharedPreferences sp;
  final box = GetStorage();

  @override
  void onInit() async {
    print('onInit method');
    super.onInit();
    //sp = await SharedPreferences.getInstance();
    await getFromSP();
    loading.value = true;


  }

  @override
  void onReady() {

  }

  saveUserToSP() {
    String userStr = jsonEncode(user.value.toMap());
    box.write('user', userStr);

    //sp.setString('user', userStr);

  }

  getFromSP() {
    try {
      //SharedPreferences sp = await SharedPreferences.getInstance();
      //final userStr = sp.getString('user');
      final String userStr = box.read('user');
      if (userStr != null && userStr.length > 0) {
        dynamic userData = jsonDecode(userStr);
        user.value = User.fromMap(userData);
      }
    } catch (e) {
      print(e);

    }
  }

  changeUserType(int newType){
    user.value.type = newType;
    saveUserToSP();
    user.refresh();
  }

  changeEmployeeState(bool online){
    user.value.online = online;
    saveUserToSP();
    user.refresh();
  }



  registerUser() async {

  }



}