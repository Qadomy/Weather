import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends ChangeNotifier {
  static const String _cityKey = 'city';
  static const String _tempKey = 'temp';
  static const String _conditionNameKey = 'conditionName';
  static const String _lastUpdateKey = 'lastUpdate';
  static SharedPreferencesService? _instance;

  SharedPreferencesService._privateConstructor();

  static SharedPreferencesService get instance {
    _instance ??= SharedPreferencesService._privateConstructor();
    return _instance!;
  }

  Future<void> saveData({
    required String city,
    required double temp,
    required String conditionName,
    required String lastUpdate,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cityKey, city);
    await prefs.setDouble(_tempKey, temp);
    await prefs.setString(_conditionNameKey, conditionName);
    await prefs.setString(_lastUpdateKey, lastUpdate);
    print(
        "############ Save city $city, temp $temp, condition $conditionName, lastUpdate $lastUpdate");
    notifyListeners(); // Notify all listeners about the data change.
  }

  Future<Map<String, dynamic>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("############ Get city ${prefs.getString(_cityKey)}");
    return {
      'city': prefs.getString(_cityKey) ?? '',
      'temp': prefs.getDouble(_tempKey) ?? 0.0,
      'conditionName': prefs.getString(_conditionNameKey) ?? '',
      'lastUpdate': prefs.getString(_lastUpdateKey) ?? '',
    };
  }
}
