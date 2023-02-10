
import 'package:flutter/material.dart';
import '/ui/pages/register_phone_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key,}) : super(key: key);
  // final String title;


  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Text(
          S.of(context).by_signing_up + '\n' + S.of(context).terms_use_privacy_policy,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: 'regular'),
        ),
      ),
    );
  }
}

Widget _buildBody(context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/p3.png'),
              width: 200,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              S.of(context).welcome_to_jumush,
              textAlign: TextAlign.center,
              style: style.boldText(),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 70.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPhoneScreen()));
                },
                icon: const Icon(Icons.call),
                label: Text(
                  S.of(context).continue_with_phone,
                  style: TextStyle(fontFamily: 'medium'),
                ),
                style: button.simpleButton(),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.android),
                label: Text(
                  'Continue With Google',
                  style: TextStyle(fontFamily: 'medium'),
                ),
                style: button.simpleButton(),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
