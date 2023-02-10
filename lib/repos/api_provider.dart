import 'dart:convert';

import 'package:http/http.dart';
const String registerUri = 'https://jumush-backend.de.r.appspot.com/register';
const String getEmployersUri = 'https://jumush-backend.de.r.appspot.com/employers'; // работодателей
const String getEmployeesUri = 'https://jumush-backend.de.r.appspot.com/employees'; // рабочих
const String getAllUri = 'https://jumush-backend.de.r.appspot.com/employees'; // всех
class ApiProvider {
  Future <String> registerUser(String body) async {
    print('registerUser method');
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    try {
      final res = await post(Uri.parse(registerUri), headers: headers, body: body);
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