
import 'package:flutter/material.dart';
import '/ui/pages/register_phone_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;


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
          'By signing up you agree to Dateapp \n Terms of Use & Privacy Policy',
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
              'Welcome to \n Jumush',
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
                      new MaterialPageRoute(
                          builder: (context) => RegisterPhoneScreen()));
                },
                icon: const Icon(Icons.call),
                label: Text(
                  'Continue With Phone',
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
