import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  var pol = ''.obs;
  var userType = 1.obs;

  void registerUser(){

  }
}