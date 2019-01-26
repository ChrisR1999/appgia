import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app_trabajo/utils/user_utils.dart';

class GoogleLogin {
  GoogleSignIn _googleSignIn;
  GoogleSignInAccount _currentUser;

  GoogleLogin() {
    _setScopes();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
      UserUtils.name = _currentUser.displayName;
      UserUtils.mail = _currentUser.email;
    });
  }

  void _setScopes() {
    _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
  }

  Future<bool> signIn() async {
    try {
      await _googleSignIn.signIn().timeout(Duration(seconds: 20));
      if (_currentUser != null) {
        print('Login exitoso');
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString() + 'Revise su conexion a internet');
      return false;
    }
  }

  Future<bool> isUserLogged() async {
    return await _googleSignIn.signInSilently().then((onValue) {
      if (onValue == null) {
        print("Error al recuperar sesión previa");
        return false;
      } else {
        print("Sesión iniciada previamente");
        UserUtils.name = onValue.displayName;
        UserUtils.mail = onValue.email;
        return true;
      }
    });
  }

  Future<void> signOut() async {
    _googleSignIn.disconnect();
  }
}
