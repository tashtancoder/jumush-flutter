import 'dart:convert';

import 'package:http/http.dart';
import '/constants/strings/texts.dart';

const String registerUri = '$gcVmServer/register';
const String changeTypeUri = '$gcVmServer/changetype';
const String getEmployersUri = '$gcVmServer/employers'; // работодателей
const String getEmployeesUri = '$gcVmServer/employees'; // рабочих
const String getAllUri = '$gcVmServer/employees'; // всех
const String changeEmployeeStateUri = '$gcVmServer/changeEmployeeState'; // make employee online, offline
const String updateEmployeeLocationUri = '$gcVmServer/updateEmployeeLocation';

class ApiProvider {
  Future <String> registerUser(String body) async {
    print('registerUser method');
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    try {
      final res = await post(Uri.parse(registerUri), headers: headers, body: body);
      print(res.body);
      if (res.statusCode == 200) {
        print('successful register');
        print(res.body);
        return res.body;
        //final resMsg = jsonDecode(res.body)

      } else {
        return 'something wrong';
      }
    } catch(e) {
      return 'Network error';
    }



  }

  Future <String> changeUserType(String body) async {
    print('changeUserType method');
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    try {
      final res = await put(Uri.parse(changeTypeUri), headers: headers, body: body);
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 202) {
        print('successful change type');
        print(res.body);
        return res.body;
        //final resMsg = jsonDecode(res.body)

      } else {
        return 'something wrong';
      }
    } catch(e) {
      return 'Network error';
    }
  }

  Future <String> changeEmployeeState(String body) async {
    print('changeEmployeeState method');
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    try {
      final res = await put(Uri.parse(changeEmployeeStateUri), headers: headers, body: body);
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 202) {
        print('successful employee state change');
        print(res.body);
        return res.body;
        //final resMsg = jsonDecode(res.body)

      } else {
        return 'something wrong';
      }
    } catch(e) {
      return 'Network error';
    }



  }

  Future <String> updateEmployeeLocation(String body) async {
    print('updateEmployeeLocation method');
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    try {
      final res = await put(Uri.parse(updateEmployeeLocationUri), headers: headers, body: body);
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 202) {
        print('successful employee location update');
        print(res.body);
        return res.body;

      } else {
        return 'something wrong';
      }
    } catch(e) {
      return 'Network error';
    }



  }

}