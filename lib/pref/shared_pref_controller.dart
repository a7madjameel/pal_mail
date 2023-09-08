import 'package:pal_mail/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { user, loggedIn, token }

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? instance;
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return instance ??= SharedPrefController._();
  }

  Future<void> initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    } else {
      return null;
    }
  }

  Future<void> save(UserData user) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setString(PrefKeys.user.name, userToJson(user));
    await _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${user.token}');
  }

  void clear() async {
    await _sharedPreferences.clear();
  }
}
