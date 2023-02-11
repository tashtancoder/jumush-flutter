
import 'package:flutter/material.dart';
import 'package:jumush/blocs/dialogs.dart';
import 'package:jumush/ui/pages/register_profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '/constants/styles/app_colors.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({required this.phoneNumber});
  //const OtpVerificationScreen({Key? key}) : super(key: key);



  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  String verificationId = '';
  int maxSec = 100;
  int counter = 0;
  bool resendActive = false;
  bool otpCompleted = false;
  bool isLoading = false;
  late SmsAutoFill smsAutoFill = SmsAutoFill();
  OtpFieldController otpFieldController = OtpFieldController();
  late FirebaseAuth _auth;
  String smsCode = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenSMSCode();
    //registerPhone();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        reverse: true,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(context) {
    print('phone number: ' + widget.phoneNumber);
    print(resendActive);
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).otp_code,
                  textAlign: TextAlign.center,
                  style: style.boldText(),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).enter_otp,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 36.0,
                ),
                /* OTPTextField(
                  controller: otpFieldController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 60,
                  style: const TextStyle(fontSize: 16),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                    smsCode = pin;
                    setState(() {
                      otpCompleted = true;
                    });
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ), */

                PinFieldAutoFill(
                  decoration: UnderlineDecoration(
                    textStyle: const TextStyle(fontSize: 20, color: appColorLight),
                    colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                  ),
                  currentCode: smsCode,
                  onCodeSubmitted: (code) {
                    print('code submitted : ');
                    print(code);
                  },
                  onCodeChanged: (code) {
                    print('code changed : ');
                    print(code!);
                    if (code!.length == 6) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        smsCode = code;
                        otpCompleted = true;
                      });
                    }
                  },
                ),

                const SizedBox(
                  height: 24.0,
                ),

                resendActive ? Container() : Text(
                  '${S.of(context).resend_code_after} $counter ${S.of(context).seconds}',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 15.0,
                ),

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: otpCompleted ? () async {
                        print('continue btn pressed');
                        CustomDialogs.showProgressIndicator(context);
                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          msg: S.of(context).successful_otp_msg,
                          textColor: Colors.white,
                          //gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterProfileScreen(phoneNumber: widget.phoneNumber,)));*/
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterProfileScreen(phoneNumber: widget.phoneNumber,)));
                        /*CustomDialogs.showProgressIndicator(context);
                        final success = await verifyOTP();
                        Navigator.of(context).pop();
                        if (success) {
                          Fluttertoast.showToast(
                            msg: S.of(context).successful_otp_msg,
                            textColor: Colors.black,
                            //gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterProfileScreen(phoneNumber: widget.phoneNumber,)));

                        } else {
                          setState(() {
                            smsCode = '';
                            resendActive = true;
                            otpCompleted = false;
                          });
                        }*/
                      } : null,
                      label: Text(
                        S.of(context).continue_,
                        style: const TextStyle(fontFamily: 'medium'),
                      ),
                      icon: const Icon(Icons.arrow_right_alt_outlined),
                      style: button.simpleButton(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton.icon(
                      onPressed: resendActive ? () {
                        print('Resend btn pressed');
                        registerPhone();

                      } : null,
                      style: button.BorderedButton(),
                      icon: const Icon(Icons.send_to_mobile),
                      label: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          S.of(context).send_again,
                          style: const TextStyle(
                            color: appColor,
                            fontSize: 16.0,
                            fontFamily: 'semi-bold',
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          S.of(context).otp_code,
          style: style.headText(),
        )
    );
  }



  Future <bool> verifyOTP() async{
    print('Verify OTP');
    try {
      var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode));
      print('inside try credentials: ');
      print(credentials);
      return credentials.user != null ? true : false;
    } catch(e) {
        print('catch');
        print(e);
        return false;
    }

  }

  startCountDown(){
    var countDownStream;
    countDownStream = countDown().listen((value) {
      if (resendActive) {
        countDownStream.cancel();
      } else {
        setState(() {
          counter = value;
        });
      }

    });

  }

  Stream <int> countDown() async* {
    for (int i = maxSec; i > 0; i --) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  registerPhone() async{
    listenSMSCode();
    startCountDown();
    setState(() {
      resendActive = false;
    });

    _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
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
              gravity: ToastGravity.CENTER,
              toastLength: Toast.LENGTH_SHORT,
          );

        },
        codeSent: (String verificationId, int? forseRersendToken) async {
          print('codeSent');
          print(verificationId);
          print(forseRersendToken);
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId){
          print('otp Time out');
          this.verificationId = verificationId;
          setState(() {
            resendActive = true;
          });

        }
    );

    print('phone authenticatiion completed');

  }

  _listenSMSCode() async {
    //final signature = await smsAutoFill.getAppSignature;
    await SmsAutoFill().listenForCode();
  }

  listenSMSCode(){
    SmsAutoFill().getAppSignature.then((value) {
      print(value);
      //smsCode = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    smsAutoFill.unregisterListener();
    super.dispose();
  }
}
