
//import 'package:date2/pages/home.dart';
//import 'package:date2/pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:jumush/constants/styles/page_ids.dart';
import '/ui/pages/otp_verification_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '/generated/l10n.dart';

class RegisterPhoneScreen extends StatefulWidget {
  const RegisterPhoneScreen({Key? key}) : super(key: key);



  @override
  _RegisterPhoneScreenState createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  final maskFormatter = MaskTextInputFormatter(mask: '+996 ### ## ## ##');

  final TextEditingController numberController = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).continue_with_phone,
                  textAlign: TextAlign.center,
                  style: style.boldText(),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).enter_valid_number,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 54.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  decoration: InputDecoration(
                    hintText: "+996 XXX XX XX XX",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  inputFormatters: [maskFormatter],
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
                        //print(numberController.text);
                        /*Navigator.of(context).pushNamedAndRemoveUntil(
                            PageIds.otpPageId,
                                (route) => false);*/
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => OtpVerificationScreen(phoneNumber: numberController.text)), (route) => false
                        );
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
              ],
            ),
          )
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
