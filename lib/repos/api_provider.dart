import 'dart:convert';

import 'package:http/http.dart';
import '/constants/strings/texts.dart';

const String registerUri = '$gcVmServer/register';
const String getEmployersUri = '$gcVmServer/employers'; // работодателей
const String getEmployeesUri = '$gcVmServer/employees'; // рабочих
const String getAllUri = '$gcVmServer/employees'; // всех
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

}