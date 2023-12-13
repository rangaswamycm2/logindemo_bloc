import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/app_settings.dart';
class SignUpApiClass{
  static String? msg;


  static Future<String> signInCall(payload) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppSettings.apiConst.loginUrl),body: json.encode(payload),headers: {'Content-Type': 'application/json'});
      if(response.statusCode == 200){
        return response.body;
      }else{
        print("Failure Case");
        msg = response.body;
        return "";
      }
      // List result = jsonDecode(response.body);
    } catch (e) {
      print("Exception");
      msg = "Exception Occurred";
      return "";
    }
  }

}