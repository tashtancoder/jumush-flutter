
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jumush/ui/components/dialogs.dart';
import 'package:jumush/controllers/user_controller.dart';
import 'package:jumush/models/user_model.dart';
import 'package:jumush/repos/api_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constants/styles/page_ids.dart';
import '/constants/styles/app_colors.dart';
import '/ui/pages/terms_conditions_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/generated/l10n.dart';
import 'package:get/get.dart';

class EmployeeSearchScreen extends StatefulWidget {
  const EmployeeSearchScreen({super.key});


  @override
  _EmployeeSearchScreenState createState() => _EmployeeSearchScreenState();
}

class _EmployeeSearchScreenState extends State<EmployeeSearchScreen> {
  LocationData? _currentLocation;
  late final MapController _mapController;
  bool _liveUpdate = false;
  bool _permission = false;
  String? _serviceError;

  final Location _locationService = Location();

  get prefixIcon => null;
  String gender = '';
  int genderIndex = 0;
  String userType = '';
  List<String> labels = [];
  int userTypeIndex = 0;
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  final userController = UserController.instance;
  final apiProvider = ApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController = MapController();
    initLocationService();
  }

  initLocationService()async{
    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 100
    );
    LocationData? location;
    bool serviceEnabled;
    bool serviceRequestResult;
    try {
      serviceEnabled = await _locationService.serviceEnabled();
      if (serviceEnabled) {
        //final permission = await _locationService.requestPermission();
        location = await _locationService.getLocation();

        print('location');
        print(location);

        setState(() {
          _currentLocation = location;
          _mapController.move(
            LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
            _mapController.zoom
          );
        });

        showModalBottom();

      }

    } on PlatformException catch (e) {
      print('flutter map init on Platform Exception');
      _serviceError = e.message;
      print(e.message);
      location = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    labels = [S.of(context).doesnt_matter, S.of(context).male, S.of(context).female];
    LatLng currenLatLng;
    if (_currentLocation != null) {
      currenLatLng = LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    } else {
      currenLatLng = LatLng(41.448608, 74.599000);
    }

    print('CurrentLatLng');
    print(currenLatLng);

    final markers = <Marker>[
      Marker(
          width: 70,
          height: 70,
          point: currenLatLng,
          builder: (ctx){
            return Icon(Icons.location_on, color: Colors.blue, size: 50,);
      })
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FlutterMap(
          mapController: _mapController,

          options: MapOptions(
            center: LatLng(currenLatLng.latitude, currenLatLng.longitude),
            zoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(markers: markers,)
          ],
        )
      ),
      /*body: SingleChildScrollView(
        reverse: true,
        child: _buildBody(context),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),*/
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, top: 2, right: 10, bottom: 5),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton.icon(
              onPressed: () {
                //searchEmployees();
                print('Search tapped');
                showModalBottom();
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsConditionsScreen())); */
              },
              label: Text(
                S.of(context).search_person,
                style: TextStyle(fontFamily: 'medium'),
              ),
              icon: const Icon(Icons.search),
              style: button.simpleButton(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          S.of(context).search_person,
          style: style.headText(),
        ));
  }


  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 24.0,
                ),
                TextField(
                  controller: jobTitleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).job_title,
                    prefixIcon: const Icon(
                      Icons.title,
                      color: appColorLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: jobDescriptionController,
                  minLines: 2,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).job_description,
                    prefixIcon: const Icon(
                      Icons.description,
                      color: appColorLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),

                Container(
                  child: ToggleSwitch(
                    minWidth: 100,
                    cornerRadius: 15,
                    totalSwitches: 3,
                    initialLabelIndex: genderIndex,
                    labels: labels,
                    activeBgColor: [appColorLight],
                    onToggle: (index) {
                      genderIndex = index ?? 0;
                      print('switched to: $index');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showModalBottom() {
    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context) {

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15)
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 24.0,
              ),
              TextField(
                controller: jobTitleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: S.of(context).job_title,
                  prefixIcon: const Icon(
                    Icons.title,
                    color: appColorLight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: jobDescriptionController,
                minLines: 2,
                maxLines: 2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: S.of(context).job_description,
                  prefixIcon: const Icon(
                    Icons.description,
                    color: appColorLight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),

              Container(
                child: ToggleSwitch(
                  minWidth: 100,
                  cornerRadius: 15,
                  totalSwitches: 3,
                  initialLabelIndex: genderIndex,
                  labels: labels,
                  activeBgColor: [appColorLight],
                  onToggle: (index) {
                    genderIndex = index ?? 0;
                    print('switched to: $index');
                  },
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),

              ElevatedButton.icon(
                onPressed: () {
                  //searchEmployees();
                  print('Search tapped');
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsConditionsScreen())); */
                },
                label: Text(
                  S.of(context).search_person,
                  style: TextStyle(fontFamily: 'medium'),
                ),
                icon: const Icon(Icons.search),
                style: button.simpleButton(),
              ),


            ],
          ),
        ),
      );


    });
  }

  Future<void> searchEmployees() async {

    final body = jsonEncode({
      'name': jobTitleController.text,
      'surname': jobDescriptionController.text,
      'pol': gender,
      'type': userTypeIndex + 1
    });
    print(body);
    CustomDialogs.showProgressIndicator(context);
    final resStr = await apiProvider.registerUser(body);
    Navigator.of(context).pop();
    if (resStr.length > 20) {
      CustomDialogs.toast(context, S.of(context).successfully_registered_msg, true);
      await Future.delayed(Duration(seconds: 2));
      final resMap = jsonDecode(resStr);
      final resBody = jsonEncode({
        'id': resMap['id'],
        'online': resMap['online'] ?? false,
        'name': jobTitleController.text,
        'surname': jobDescriptionController.text,
        'pol': gender,
        'type': userTypeIndex + 1
      });
      userController.user.value = User.fromMap(jsonDecode(resBody));
      await userController.saveUserToSP();
      Navigator.of(context).pushNamedAndRemoveUntil(
          PageIds.mainTabView, (route) => false);

    } else {
      CustomDialogs.toast(context, S.of(context).something_wrong, false);
    }


  }
}
