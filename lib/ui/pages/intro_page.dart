/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/ui/pages/welcome_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/generated/l10n.dart';

class IntroPage extends StatefulWidget {
  // const SliderScreen({Key? key, required this.title}) : super(key: key);
  // final String title;


  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomePage()));
              },
              style: button.simpleButton(),
              child: Text(
                S.of(context).get_started,
                style: TextStyle(fontFamily: 'medium'),
              ),
            )),
      ),
    );
  }

  Widget _buildBody(context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          carouselController: _controller,
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: i == 1
                        ? _buildSlide1(context)
                        : (i == 2
                            ? _buildSlide2(context)
                            : (i == 3
                                ? _buildSlide3(context)
                                : _buildSlide3(context))));
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSlide1(context) {
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
                width: 180,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Easily Start With Unique Conversation',
                    textAlign: TextAlign.center, style: style.boldText()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                    'Meet someone sit amet, consectetur adipiscing elit. Eget nibh metus luctes.',
                    textAlign: TextAlign.center,
                    style: style.simpleBoldText()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlide2(context) {
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Get To Know Someone\'s Personality',
                    textAlign: TextAlign.center, style: style.boldText()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                    'Meet someone sit amet, consectetur adipiscing elit. Eget nibh metus luctes.',
                    textAlign: TextAlign.center,
                    style: style.simpleBoldText()),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSlide3(context) {
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
                width: 180,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Start Dating With Your Partners',
                    textAlign: TextAlign.center, style: style.boldText()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Meet someone sit amet, consectetur adipiscing elit. Eget nibh metus luctes.',
                  textAlign: TextAlign.center,
                  style: style.simpleBoldText(),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.only(top: 50.0),
              //   child: ElevatedButton(
              //     child: const Text(
              //       "Get Started",
              //       style: TextStyle(fontFamily: 'medium'),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           new MaterialPageRoute(
              //               builder: (context) => new WelcomePage()));
              //     },
              //     style: style.simpleButton(),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
