import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = 'USERLOGGEDINKEY';

  static saveUserLoggedInDetals({@required bool isLoggedIn}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(userLoggedInKey, isLoggedIn);
  }

  static Future<bool> getUserLoggedInDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedInKey);
  }
}
