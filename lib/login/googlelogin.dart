import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app_trabajo/utils/user_utils.dart';

class GoogleLogin {
  GoogleSignIn _googleSignIn;
  GoogleSignInAccount _currentUser;
  UserUtils user;

  GoogleLogin() {
    _setScopes();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
      user = new UserUtils(
          name: _currentUser.displayName, mail: _currentUser.email
          );
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
        print("adios");
        return false;
      } else {
        print("hola");
        new UserUtils(name: onValue.displayName, mail: onValue.email);
        return true;
      }
    });
  }

  Future<void> signOut() async {
    _googleSignIn.disconnect();
  }
}
