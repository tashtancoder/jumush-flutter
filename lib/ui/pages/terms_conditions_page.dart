
import 'package:flutter/material.dart';
import 'package:jumush/ui/pages/welcome_page.dart';
import '/constants/styles/page_ids.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/generated/l10n.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);


  @override
  _TermsConditionsScreenState createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: _buildBody(context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WelcomePage())
                );
              },
              label: Text(
                S.of(context).agree,
                style: const TextStyle(fontFamily: 'medium'),
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          S.of(context).terms_and_conditions,
          style: style.headText(),
        ));
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please read carefully our terms & condotions',
                  style: style.headText(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry Lorem Ipsum has been the industry',
                  style: style.simpleText(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      activeColor: Color(0xFF3dc2ff),
                      value: this.value,
                      onChanged: (bool) {
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Be Yourself',
                      style: style.headText(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: style.simpleText(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      activeColor: Color(0xFF3dc2ff),
                      value: this.value,
                      onChanged: (bool) {
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Stay Safe',
                      style: style.headText(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: style.simpleText(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      activeColor: Color(0xFF3dc2ff),
                      value: this.value,
                      onChanged: (bool) {
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Stay Safe',
                      style: style.headText(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: style.simpleText(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
