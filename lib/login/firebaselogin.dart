import 'package:flutter/material.dart';
import 'package:app_trabajo/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SmsVerification {
  final String number;
  final BuildContext context;
  final Function onWaiting;
  final Function onAutomaticSuccess;
  final Function onAutomaticFailure;
  final Function onManualSuccess;
  final Function onManualFailure;
  final Function onErrorMessage;

  String verificationId;
  FirebaseAuth _auth;

  SmsVerification(
      {this.number,
      this.context,
      this.onWaiting,
      this.onAutomaticSuccess,
      this.onAutomaticFailure,
      this.onManualSuccess,
      this.onManualFailure,
      this.onErrorMessage}) {
    _auth = FirebaseAuth.instance;
    _auth.setLanguageCode('es');
  }

  Future<void> sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser _user) {
      print(
          'Verificacion de número automatica exitosa": signInWithPhoneNumber auto succeeded: $_user');
      UserUtils.firebaseId = _user.uid;
      UserUtils.number = _user.phoneNumber;
      onAutomaticSuccess();
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(
          'Verificacion de numero fallida. Codigo error: ${authException.code}. Mensaje: ${authException.message}');
      onErrorMessage();
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      print("Codigo enviado a: " + number);
      onWaiting();
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
      print("Fuera de tiempo...");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<bool> signInWithPhoneNumber(String smsCode) async {
    bool success;
    print('Iniciando sesion en firebase...');
    await FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((FirebaseUser _user) async {
      if (_user != null) {
        UserUtils.name = _user.uid;
        UserUtils.number = _user.phoneNumber;
        print(
            "Logeo con introducción de codigo SMS manual: exitoso con el número:" +
                _user.phoneNumber);
        success = true;
        onManualSuccess();
      } else
        success = false;
    }).catchError((error) {
      print("ERROR a la hora de iniciar sesion con SMS manual: " +
          error.toString());
      onManualFailure();
      success = false;
    });
    return success;
  }
}
