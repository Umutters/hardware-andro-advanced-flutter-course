import 'package:hwa_learn/202/ders12/cache/shared_not_initialized.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _checkInitialized(SharedPreferences? prefs) {
    if (prefs == null) {
      throw SharedNotInitialized();
    }
  }

  Future<(bool, String)> saveString(String value, SharedKeys key) async {
    _checkInitialized(_prefs);
    if (await _prefs?.setString(key.name, value) == false) {
      throw Exception("SharedPreferences saveString failed");
    } else {
      return (true, "başarılı bir şekilde kaydedildi");
    }
  }

  String? getString(SharedKeys key) {
    return _prefs?.getString(key.name);
  }

  Future<(bool, String)> removeValue(SharedKeys key) async {
    _checkInitialized(_prefs);
    if (await _prefs?.remove(key.name) == false) {
      throw Exception("SharedPreferences removeValue failed");
    } else {
      return (true, "başarılı bir şekilde silindi");
    }
  }
}
