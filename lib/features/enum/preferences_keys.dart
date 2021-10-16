enum PreferencesKeys { SQFLITE_INITIALIZED }

extension PreferencesKeysValueExtension on PreferencesKeys {
  String get rawValue {
    switch (this) {
      case PreferencesKeys.SQFLITE_INITIALIZED:
        return "sqflite_initialized";
    }
  }
}
