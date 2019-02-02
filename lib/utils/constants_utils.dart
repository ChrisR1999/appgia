abstract class StringConstants {
  static const String appBarTitle = 'GIA Assistent';
  static const String loginMessage = 'Iniciando sesión...';
  static const String settingAppBarTitle = 'Configuración';
  static const String userLabel = 'Número de Usuario *';
  static const String setUser = 'Ingrese Número';
  static const String passwordLabel = 'Contraseña *';
  static const String setPassword = 'Ingrese Contraseña';
  static const String userIncomplete = 'Número incompleto';
  static const String setPhoneNumber = 'Ingrese Número Celular';
  static const String number = 'Número *';
  static const String phonePrefix = '+52';
  static const String numberIssue = 'Error con tú número, favor de revisarlo';
  static const String emptyCamp = 'No se puede dejar el campo vacio';
  static const String incompleteNumber = 'Número incompleto';
  static const String prefixIncomplete = 'Prefijo telefonico incompleto';
  static const String messageAdvertisement =
      "Es posible que tu operador de telefonía te cobre una tarifa por el servicio de mensajes de texto.";
  static const String sendingMessage = 'Mandando mensaje...';
  static const String send = 'Enviar';
  static const String setVerificationCode = "Ingrese el codigo recibido";
  static const String numberSended = "Número introducido:";
  static const String code = 'Codigo *';
  static const String verifyCode = 'Codigo de verificación';
  static const String incompleteCode = 'Codigo incompleto';
  static const String verify = 'Verificar';
  static const String checkingNumber = "Esperando mensaje";
  static const String successAutomaticNumber =
      "Verificación automatica exitosa";
  static const String failureAutomaticNumber =
      "Verificación automatica fallida";
  static const String successManualNumber = "Verificación exitosa";
  static const String failureManualNumber = "Verificación fallida";
  static const String errorMessage =
      "Error al mandar mensaje, revise su número/conexión a internet, y vuelva a intentarlo en unos momentos";
  static const String processing = 'Procesando...';
  static const String loading = 'Cargando';
}

abstract class LoginConstants {
  static const String googleLogin = 'Google';
  static const String iosLogin = 'IOS';
  static const String corporativeLogin = 'Corporative';
}

abstract class PanicConstants {
  static const String healthPanicLabel = 'Salud';
  static const String healthPanicIndicator = 'salud';
  static const String healthImageRoute = 'images/salud.png';
  static const String healthBackgroundImageRoute='images/fondo_medicina.png';
  static const String securityPanicLabel = 'Seguridad';
  static const String securityPanicIndicator = 'seguridad';
  static const String securityImageRoute = 'images/guardia.png';
  static const String securityBackgroundImageRoute = 'images/fondo_guardia.png';
  static const String protectionPanicLabel = 'Prot. Civil';
  static const String protectionPanicIndicator = 'proteccion';
  static const String protectionImageRoute = 'images/pCivil.png';
  static const String protectionBackgroundImageRoute = 'images/fondo_proteccion.png';
}

abstract class SharedConstants {
  static const String activeLogin = 'activeLogin';
  static const int nullLogin = 0;
  static const int googleLogin = 1;
  static const int iosLogin = 2;
  static const int corporativeLogin = 3;
}
