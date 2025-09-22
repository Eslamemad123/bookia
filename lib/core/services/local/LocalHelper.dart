import 'dart:convert';

import 'package:bookia/features/auth/data/models/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Local_helper {
  static late SharedPreferences pref;
  static String kUserData = 'user_data';
  static init() async {
    pref = await SharedPreferences.getInstance();
  }
  //set & get User Data

  static setUserData(User_Data? userData) async {
    if (userData == null) return;
    var DataAsjson = userData.toJson();

    var dataAsString = jsonEncode(DataAsjson);

    await pref.setString(kUserData, dataAsString);
  }

  static Future<User_Data?> getUserData() async {
    var data = pref.getString(kUserData);
    if (data == null) return null;

    var dataAsJson = jsonDecode(data);

    return User_Data.fromJson(dataAsJson);
  }

  //Set
  static Future<bool> setString(String key, String value) {
    return pref.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) {
    return pref.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return pref.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return pref.setInt(key, value);
  }

  static Future<bool> setListString(String key, List<String> value) {
    return pref.setStringList(key, value);
  }

  //Get
  static String? getString(String key) {
    return pref.getString(key);
  }

  static bool? getBool(String key) {
    return pref.getBool(key);
  }

  static double? getDouble(String key) {
    return pref.getDouble(key);
  }

  static int? getInt(String key) {
    return pref.getInt(key);
  }

  static List<String>? getListString(String key) {
    return pref.getStringList(key);
  }

  //remove and clear
  static Future<bool> remove(String key) {
    return pref.remove(key);
  }

  static Future<bool> clear() {
    return pref.clear();
  }
}
