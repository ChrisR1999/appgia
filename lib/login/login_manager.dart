import 'package:app_trabajo/login/googlelogin.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_trabajo/shared_preferences/sharedpreferences.dart';

class LoginManager {
  Future<bool> isUserLogged() async {
    bool sucess;
    int activeLogin;

    activeLogin = SharedGia.getActiveLogin();

    switch (activeLogin) {
      case SharedConstants.googleLogin:
        GoogleLogin _googleLogin = new GoogleLogin();
        sucess = await _googleLogin.isUserLogged().catchError((onError) {
          sucess = false;
        });
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

  Future<bool> isUserLoggedinFirebase() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    bool sucess = await _auth.currentUser().then((FirebaseUser _user) {
      if (_user != null) {
        UserUtils.firebaseId = _user.uid;
        UserUtils.number = _user.phoneNumber;
        return true;
      } else
        return false;
    }).catchError((onError) {
      return false;
    });
    return sucess;
  }
}
