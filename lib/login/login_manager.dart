import 'package:app_trabajo/login/googlelogin.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/shared_preferences/sharedpreferences.dart';

class LoginManager {

  Future<bool> logIn() async {
    bool sucess;
    int activeLogin;
    await SharedGia.initShared();
    activeLogin = SharedGia.getActiveLogin();
    switch (activeLogin) {
      case SharedConstants.googleLogin:
        GoogleLogin _googleLogin = new GoogleLogin();
        sucess = await _googleLogin.isUserLogged();
        break;
      case SharedConstants.iosLogin:
        sucess = true;
        break;
      case SharedConstants.corporativeLogin:
        sucess = true;
        break;
      case SharedConstants.nullLogin:
        sucess = false;
        break;
      default:
        sucess = false;
        break;
    }
    return sucess;
  }
}
