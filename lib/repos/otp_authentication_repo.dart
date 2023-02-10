import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final int maxSec = 100;
  var verificationId = ''.obs;

  Future<void> phoneAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        //phoneNumber: '+996502248712',
        timeout: Duration(seconds: maxSec),
        //verificationCompleted: null,
        verificationCompleted: (PhoneAuthCredential credential) async{
          print('Credentials: ${credential}');
          //await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('verification failed');
          print(e.code);
          Fluttertoast.showToast(
            msg: e.code,
            textColor: Colors.red,
            //gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
          );

        },
        codeSent: (String verificationId, int? forseRersendToken) async {
          print('codeSent');
          print(verificationId);
          print(forseRersendToken);
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId){
          print('otp Time out');
          this.verificationId.value = verificationId;
        }
    );
  }

  Future <bool> verifyOTP(String smsCode) async{
    print('Verify OTP');
    try {
      var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: smsCode));
      print('inside try credentials: ');
      print(credentials);
      return credentials.user != null ? true : false;
    } catch(e) {
      print('catch');
      print(e);
      return false;
    }

  }

}