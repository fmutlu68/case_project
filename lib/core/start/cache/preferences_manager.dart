import 'package:shared_preferences/shared_preferences.dart';

import 'ICacheService.dart';

class PreferencesManager implements ICacheService {
  static PreferencesManager? _instance;
  static PreferencesManager get instance {
    if (_instance == null) _instance = PreferencesManager._init();
    return _instance!;
  }

  PreferencesManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }

  SharedPreferences? _preferences;

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  @override
  T getObject<T>(String key) {
    return _preferences!.get(key) as T;
  }

  @override
  void setBool(String key, bool value) {
    _preferences!.setBool(key, value);
  }

  @override
  void setString(String key, String value) {
    _preferences!.setString(key, value);
  }
}
