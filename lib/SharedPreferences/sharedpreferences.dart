import 'dart:async';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedGia {
  static SharedPreferences _prefs;
  static int _activeLogin;

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance().catchError((onError){
      return onError;
    });
  }

  static int getActiveLogin() {
    _activeLogin = (_prefs.getInt(SharedConstants.activeLogin) ?? 0);
    return _activeLogin;
  }

  static void setActiveLogin(int login) async {
    _activeLogin = login;
    await _prefs.setInt(SharedConstants.activeLogin, login).catchError((onError){
      return onError;
    });
  }
}
