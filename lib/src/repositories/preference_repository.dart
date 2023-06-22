import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hulu_advert/src/models/preference_model.dart';

class PreferenceRepository {
  PreferenceRepository()
      : _prefs = SharedPreferences.getInstance(),
        _secureStorage = const FlutterSecureStorage(),
        _logger = Get.find<Logger>();

  static const String _keyIsFirstTime = 'isFirstTime';
  static const String _keyIsDarkMode = 'isDarkMode';

  static const String _keyCurrentUser = 'currentUser';

  final Future<SharedPreferences> _prefs;
  final FlutterSecureStorage _secureStorage;
  final Logger _logger;

  Future<void> _setString(String key, String value) async {
    final pref = await _prefs;
    await pref.setString(key, value);
  }

  Future<void> _setBool(String key, bool value) async {
    final pref = await _prefs;
    await pref.setBool(key, value);
  }

  Future<bool?> _getBool(String key) async {
    final pref = await _prefs;
    return pref.getBool(key);
  }

  Future<String?> _getString(String key) async {
    final pref = await _prefs;
    return pref.getString(key);
  }

  Future<void> _removeKey(String key) async {
    final pref = await _prefs;
    await pref.remove(key);
  }

  // setters
  Future<void> setAppPref({required Preference value}) async {
    if (value.isFirstTime != null) {
      await _setBool(_keyIsFirstTime, value.isFirstTime!);
    }
    if (value.isDarkMode != null) {
      await _setBool(_keyIsDarkMode, value.isDarkMode!);
    }

    if (value.currentUser != null) {
      await _setString(_keyCurrentUser, jsonEncode(value.currentUser!.toMap()));
    }
  }

  Future<Preference> getAppPref() async {
    final bool? isFirstTime = await _getBool(_keyIsFirstTime);
    final bool? isDarkMode = await _getBool(_keyIsDarkMode);

    final String? cu = await _getString(_keyCurrentUser);
    UserModel? currentUser;
    if (cu != null) {
      currentUser = UserModel.fromMap(jsonDecode(cu));
    }

    return Preference(
      isFirstTime: isFirstTime,
      isDarkMode: isDarkMode,
      currentUser: currentUser,
    );
  }

  Future<void> removeAuth() async {
    _removeKey(_keyCurrentUser);
  }
}
