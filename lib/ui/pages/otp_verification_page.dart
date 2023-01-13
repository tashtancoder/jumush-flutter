
import 'package:flutter/material.dart';
import 'package:jumush/ui/pages/register_profile_page.dart';
import '/constants/styles/app_colors.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);



  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        reverse: true,
        child: _buildBody(context),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
    );
  }

  Widget _buildBody(context) {
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
                  'OTP Code',
                  textAlign: TextAlign.center,
                  style: style.boldText(),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Type the verification code that we\'ve sent you.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 36.0,
                ),
                OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 60,
                  style: const TextStyle(fontSize: 16),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterProfileScreen()));
                      },
                      label: Text(
                        'Continue',
                        style: TextStyle(fontFamily: 'medium'),
                      ),
                      icon: const Icon(Icons.arrow_right_alt_outlined),
                      style: button.simpleButton(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Text(
                  'Send Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appColor,
                    fontSize: 16.0,
                    fontFamily: 'semi-bold',
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
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
