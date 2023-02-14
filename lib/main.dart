import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import '/controllers/user_controller.dart';
import '/firebase_options.dart';
import '/ui/pages/main_tab_view.dart';
import '/ui/pages/otp_verification_page.dart';
import '/ui/pages/register_phone_page.dart';
import '/ui/pages/register_profile_page.dart';
import '/ui/pages/welcome_page.dart';
import '/constants/styles/page_ids.dart';
import '/ui/pages/intro_page.dart';
import '/constants/styles/app_colors.dart';
import 'package:intl/intl.dart';
import '/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/src/transition.dart' as bloc_transition;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as get_transition;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class InitialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class InitialPageState extends State<InitialPage> {
  final userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    print(userController.user.value.name);
    print(userController.loading.value);
    return MaterialApp(
      title: 'Jumush',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
        Locale('kg')
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          brightness: Brightness.light,
          primaryColor: appColor,
          fontFamily: 'regular'
      ),
      home: userController.loading.value == true ?
      (userController.user.value.name.length > 1 ? const MainTabView() : const IntroPage()) :
      const Center(child: CircularProgressIndicator(),),
      routes: {
        PageIds.introPageId: (context) => const IntroPage(),
        PageIds.welcomePageId: (context) => const WelcomePage(),
        PageIds.registerPhonePageId: (context) => const RegisterPhoneScreen(),
        //PageIds.otpPageId: (context) => const OtpVerificationScreen(),
        //PageIds.registerProfilePageId: (context) => const RegisterProfileScreen(),
        PageIds.mainTabView: (context) => const MainTabView()
      },
    );
  }

  Future<void> waitUntilDataReady() async{
    await Future.delayed(Duration(seconds: 3), );
  }







}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final userController = Get.put(UserController());



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(userController.user.value.name);
    return MaterialApp(
      title: 'Jumush',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
        Locale('kg')
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,
        primaryColor: appColor,
        fontFamily: 'regular'
      ),
      home: userController.user.value.name.length > 1 ? const MainTabView() : const IntroPage(),
      routes: {
        PageIds.introPageId: (context) => const IntroPage(),
        PageIds.welcomePageId: (context) => const WelcomePage(),
        PageIds.registerPhonePageId: (context) => const RegisterPhoneScreen(),
        //PageIds.otpPageId: (context) => const OtpVerificationScreen(),
        //PageIds.registerProfilePageId: (context) => const RegisterProfileScreen(),
        PageIds.mainTabView: (context) => const MainTabView()
      },
    );
  }
}

class MyBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change){
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, bloc_transition.Transition transition){
    super.onTransition(bloc, transition);
  }


}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
