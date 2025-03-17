import 'package:barid/core/util/shared_preferences_helper.dart';
import 'constants.dart';

class TokenUtil {
  static String _token = '';

  static Future<void> loadTokenToMemory() async {
    _token =
        (await PreferenceManager.getInstance()!.getString(Constants.token)) ??
            '';
  }

  static Future<String> getTokenFromMemory() async {
    await loadTokenToMemory();
    return _token;
  }

  static void saveToken(String token) {
    PreferenceManager.getInstance()!.saveString(Constants.token, token);
    loadTokenToMemory();
  }

  static void clearToken() {
    PreferenceManager.getInstance()!.remove(Constants.token);
    _token = '';
  }
}
