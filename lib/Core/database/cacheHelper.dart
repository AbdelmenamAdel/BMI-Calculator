import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? gettData({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setData({required String key, required value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    } else {
      return false;
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> saveData({required String key, required value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  void clearData() {
    sharedPreferences.clear();
  }

  void deleteData({required String key}) {
    sharedPreferences.remove(key);
  }
}
